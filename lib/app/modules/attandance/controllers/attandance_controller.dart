import 'dart:convert';
import 'package:argon_user/Constants/string_constants.dart';
import 'package:argon_user/Models/holidayDataModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';
import '../../../../Constants/api_constants.dart';
import '../../../../Constants/sizeConstant.dart';
import '../../../../Models/AttandanceLIstModel.dart';
import '../../../../Models/DateWiseDataModel.dart';
import '../../../../Utilities/customeDialogs.dart';
import '../../../../Utilities/utility_functions.dart';
import '../../../../main.dart';
import '../../../data/network_client.dart';
import '../../../routes/app_pages.dart';
import '../views/attandance_view.dart';

class AttandanceController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final count = 0.obs;
  RxBool webClockIn = false.obs;
  RxBool hasData = false.obs;
  RxBool hasFirstTime = true.obs;
  Rx<DateTime> now = DateTime.now().obs;
  Rx<DateTime> end = DateTime.now().obs;
  GlobalKey globalKey = GlobalKey();
  DateTime selected = DateTime.now();
  RxList<AttendanceDetailsModel> attandanceList =
      RxList<AttendanceDetailsModel>([]);
  RxList<Attandance> leaveList = RxList<Attandance>([]);
  RxList<HolidayData> allHolidayList = RxList<HolidayData>([]);
  List<String> columnData = ["Date", "Total Time"];
  List<String> columnDataForDay = ["Status", "Time"];
  RxString selectedDate = "".obs;
  ScrollControllers? scrollController = ScrollControllers();
  ScrollControllers? scrollController1 = ScrollControllers();
  RxList<AttendanceDetail> getDataOfDay = RxList<AttendanceDetail>([]);
  final List<Meeting> meetings = <Meeting>[];

  @override
  void onInit() {
    print("Box Mail := ${box.read(StringConstants.userEmailAddress)}");
    if (isNullEmptyOrFalse(box.read(StringConstants.userEmailAddress)) ||
        isNullEmptyOrFalse(box.read(StringConstants.isUserLogIn))) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      getLastDateOfMonth(now.value);

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        callApiForGetTodayEntry(context: Get.context!, isFromButton: true);
        callApiForGetHolidays(context: Get.context!, isFromButton: true);
      });
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getLastDateOfMonth(DateTime now) {
    DateTime lastDayOfMonth = new DateTime(now.year, now.month + 1, 0);
    DateTime fDayOfMonth = new DateTime(now.year, now.month, 1);

    return lastDayOfMonth;
  }

  getTotalTime(int sec) {
    Duration diff = Duration(seconds: sec);

    String h = strDigits(diff.inHours.remainder(24));
    String mm = strDigits(diff.inMinutes.remainder(60));
    String ss = strDigits(diff.inSeconds.remainder(60));
    return '$h : $mm : $ss';
  }

  String strDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  callApiForGetTodayEntry(
      {required BuildContext context, bool isFromButton = false}) {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};

    dict["email"] = box.read(StringConstants.userEmailAddress);

    dict["date1"] = DateFormat('yyyy-MM-dd')
        .format(DateTime(now.value.year, now.value.month - 7, now.value.day));

    dict["date2"] = DateFormat('yyyy-MM-dd').format(getLastDateOfMonth(
        DateTime(now.value.year, now.value.month + 3, now.value.day)));

    FormData data = FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.dateWiseData,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        List data = jsonDecode(response) as List;
        //
        attandanceList =
            data.map((e) => AttendanceDetailsModel.fromJson(e)).toList().obs;
        count.value++;
        getDataOfDay.value.clear();
        selectedDate.value = attandanceList.last.date.toString();
        if (attandanceList.last.data!.isNotEmpty) {
          getDataOfDay.addAll(attandanceList.last.data!);
        }
        callApiForGetLeave(context: context, isFromButton: true);
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

  callApiForGetLeave(
      {required BuildContext context, bool isFromButton = false}) {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};

    dict["email"] = box.read(StringConstants.userEmailAddress);
    dict["select_op"] = "get_all_leave"; //re

    FormData data = FormData.fromMap(dict);

    hasData.value = false;

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.leave,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        hasData.value = true;

        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        Map<String, dynamic> m = jsonDecode(response) as Map<String, dynamic>;
        GetAttandanceListModel attandanceListModel =
            GetAttandanceListModel.fromJson(m);
        if (!isNullEmptyOrFalse(attandanceListModel.data)) {
          List<Attandance> reverse = [];
          reverse.addAll(attandanceListModel.data!);

          leaveList.addAll(reverse.reversed.toList());
        }
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

  callApiForGetHolidays(
      {required BuildContext context, bool isFromButton = false}) {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};

    dict["select_op"] = "get_all_holiday"; //re

    FormData data = FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.holiday,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        Map<String, dynamic> m = jsonDecode(response) as Map<String, dynamic>;
        HolidayDataModel holidayListModel = HolidayDataModel.fromJson(m);
        if (!isNullEmptyOrFalse(holidayListModel.data)) {
          List<HolidayData> reverse = [];
          reverse.addAll(holidayListModel.data!);
          allHolidayList.addAll(reverse.reversed.toList());
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

  @override
  void onClose() {}
  void increment() => count.value++;
}
