import 'dart:async';
import 'dart:convert';

import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:argon_user/Models/checkInOutModel.dart';
import 'package:argon_user/Utilities/utility_functions.dart';
import 'package:argon_user/app/modules/login/controllers/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

import '../../../../Constants/api_constants.dart';
import '../../../../Constants/string_constants.dart';
import '../../../../Models/ClockInOutModel.dart';
import '../../../../Utilities/customeDialogs.dart';
import '../../../../main.dart';
import '../../../data/network_client.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  RxInt selectedDrawerIndex = 0.obs;
  Timer? countdownTimer;
  RxString days = "0".obs;
  RxString hours = "00".obs;
  RxString minutes = "00".obs;
  RxString second = "00".obs;
  RxString selected = "".obs;
  String serverDate = "";
  String serverTime = "";
  Duration? myDuration;
  int totalSecond = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool webClockIn = false.obs;
  ClockInOutModel? clockInOutModel;
  ScrollControllers? scrollController = ScrollControllers();
  RxBool hasData = false.obs;
  List<String> columnData = ["Status", "Time"];

  @override
  void onInit() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      GetStorage.init();

      callApiForClockInOrOutStatus(context: Get.context!);
      callApiForGetTodayEntry(context: Get.context!, isFromButton: true);
    });
    super.onInit();

    myDuration = Duration(days: 5);
  }

  callApiForClockInOrOut({
    required BuildContext context,
  }) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    // DateTime d = await NTP.now();

    Map<String, dynamic> dict = {};
    //  GetStorage box = GetStorage();
    dict["email"] = box.read(StringConstants.userEmailAddress);
    dict["st"] = (webClockIn.value) ? "out" : "in";

    await callApiForGetServerTime(context: context, isFromButton: true);

    dict["time"] = (!isNullEmptyOrFalse(serverTime))
        ? serverTime
        : DateFormat('HH:mm:ss').format(DateTime.now());

    dict["date"] = (!isNullEmptyOrFalse(serverDate))
        ? serverDate
        : DateFormat('yyyy-MM-dd').format(DateTime.now());
    //dict["date"] = "2022-05-29";
    dict["total"] = "$totalSecond";
    dict["data_st"] = "at_entry";
    // dict["pass"] = passController.value.text;
    FormData data = FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.clockInOut,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        callApiForGetTodayEntry(context: Get.context!, isFromButton: true);
        if (response["status"] == "1") {
          webClockIn.toggle();
          if (!webClockIn.value) {
            stopTimer();
          } else {
            callApiForClockInOrOutStatus(
                context: Get.context!, isFromButton: true);
          }
        }
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    countdownTimer!.cancel();
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    myDuration = Duration(days: 5);
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;

    final seconds = myDuration!.inSeconds + reduceSecondsBy;

    totalSecond = (myDuration!.inSeconds + reduceSecondsBy);

    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);

      hours.value = strDigits(myDuration!.inHours.remainder(24));
      minutes.value = strDigits(myDuration!.inMinutes.remainder(60));
      second.value = strDigits(myDuration!.inSeconds.remainder(60));
    }
  }

  String strDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  callApiForClockInOrOutStatus(
      {required BuildContext context, bool isFromButton = false}) {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};

    dict["email"] = box.read(StringConstants.userEmailAddress);

    dict["date"] = DateFormat('yyyy-MM-dd').format(DateTime.now());

    dict["data_st"] = "last_record";

    FormData data = FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.clockInOut,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        CheckInOutModel checkInOutModel = CheckInOutModel.fromJson(response);
        if (checkInOutModel != null &&
            !isNullEmptyOrFalse(checkInOutModel.data)) {
          if (checkInOutModel.data!.st == "in") {
            webClockIn.value = true;
            DateTime now = getDateFromString(
                checkInOutModel.data!.time.toString(),
                formatter: 'HH:mm:ss');
            totalSecond = int.parse(checkInOutModel.data!.total.toString());

            Duration diff = DateTime.now().difference(now);

            myDuration = Duration(
                seconds: (diff.inSeconds +
                    int.parse(checkInOutModel.data!.total.toString())));
            startTimer();
          } else {
            webClockIn.value = false;
            DateTime now = getDateFromString(
                checkInOutModel.data!.time.toString(),
                formatter: 'HH:mm:ss');

            Duration diff = Duration(
                seconds: int.parse(checkInOutModel.data!.total.toString()));
            totalSecond = int.parse(checkInOutModel.data!.total.toString());
            hours.value = strDigits(diff.inHours.remainder(24));
            minutes.value = strDigits(diff.inMinutes.remainder(60));
            second.value = strDigits(diff.inSeconds.remainder(60));
          }
        }
      },
      failureCallback: (status, message) {
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
  }

  callApiForGetServerTime(
      {required BuildContext context, bool isFromButton = false}) {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};

    FormData data = FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getTime,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        Map s = jsonDecode(response);
        // response as Map<String, String>;
        serverDate = s["date"].toString();
        serverTime = s["time"].toString();
      },
      failureCallback: (status, message) {
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
  }

  callApiForGetTodayEntry(
      {required BuildContext context, bool isFromButton = false}) {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};
    hasData.value = false;

    dict["email"] = box.read(StringConstants.userEmailAddress);

    dict["date"] = DateFormat('yyyy-MM-dd').format(DateTime.now());

    dict["data_st"] = "today_entry";

    FormData data = FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.clockInOut,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        hasData.value = true;

        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        clockInOutModel = ClockInOutModel.fromJson(response);
      },
      failureCallback: (status, message) {
        hasData.value = true;

        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
