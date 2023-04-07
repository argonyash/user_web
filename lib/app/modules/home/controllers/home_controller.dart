import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:argon_user/Models/checkInOutModel.dart';
import 'package:argon_user/Utilities/utility_functions.dart';
import 'package:argon_user/app/modules/login/controllers/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;

import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';
import '../../../../Constants/api_constants.dart';
import '../../../../Constants/string_constants.dart';
import '../../../../Models/ClockInOutModel.dart';
import '../../../../Models/DateWiseDataModel.dart';
import '../../../../Models/chart_sample_data.dart';
import '../../../../Models/holidayDataModel.dart';
import '../../../../Utilities/customeDialogs.dart';
import '../../../../main.dart';
import '../../../data/network_client.dart';
import '../../../routes/app_pages.dart';
import '../../attandance/controllers/attandance_controller.dart';

class HomeController extends GetxController {
  RxInt selectedDrawerIndex = 0.obs;
  Timer? countdownTimer;
  RxString days = "0".obs;
  RxString hours = "00".obs;
  RxString minutes = "00".obs;
  RxString second = "00".obs;
  RxString selected = "".obs;
  String serverDate = "";
  DateTime serverFullTime = DateTime.now();
  String serverTime = "";
  Duration? myDuration;
  int totalSecond = 0;
  RxString selectedDate = "".obs;
  final count = 0.obs;
  Rx<DateTime> now = DateTime.now().obs;
  Rx<DateTime> selectedMonth = DateTime.now().obs;
  late RxInt selectedIndexForEntry;
  RxString totalTime = getTotalTime(0).obs;
  RxInt counter = 0.obs;
  RxList<ChartSampleData> chartData = RxList<ChartSampleData>([]);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool webClockIn = false.obs;
  ClockInOutModel? clockInOutModel;

  RxList<AttendanceDetail> getDataOfDay = RxList<AttendanceDetail>([]);
  RxList<AttendanceDetail> dataEntryList = RxList<AttendanceDetail>([]);
  RxList<AttendanceDetailsModel> dataList = RxList<AttendanceDetailsModel>([]);
  late DateTime lastDateOfMonth;
  RxList<HolidayData> allHolidayList = RxList<HolidayData>([]);

  RxInt monthTotalTime = 0.obs;
  RxList<AttendanceDetailsModel> attendanceDetailsList =
      RxList<AttendanceDetailsModel>([]);
  ScrollControllers? scrollController = ScrollControllers();
  RxBool hasData = false.obs;
  RxBool myHasData = false.obs;
  List<String> columnData = ["Status", "Time"];

  RxInt totalMonthHourVisibleCounter = 0.obs;
  @override
  void onInit() {
    // print("Box Mail := ${box.read(StringConstants.userEmailAddress)}");
    if (isNullEmptyOrFalse(box.read(StringConstants.userEmailAddress)) ||
        isNullEmptyOrFalse(box.read(StringConstants.isUserLogIn))) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      selectedIndexForEntry = 0.obs;

      lastDateOfMonth = getLastDateOfMonth(selectedMonth.value);
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        myApiCallApiForGetServerTime(context: Get.context!);
        await getAttendanceDetails(context: Get.context!);
        // callApiForGetDateWiseEntry(context: Get.context!);
        // callApiForClockInOrOutStatus(context: Get.context!);
        // callApiForGetTodayEntry(context: Get.context!, isFromButton: true);
      });
    }

    super.onInit();

    myDuration = Duration(days: 5);
  }

  myApiCallApiForGetServerTime(
      {required BuildContext context, bool isFromButton = false}) {
    myHasData.value = false;
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
        // print("myApiCallApiForGetServerTime Done");
        Map s = jsonDecode(response);
        DateTime sDate =
            getDateFromString(s["date"].toString(), formatter: 'yyyy-MM-dd');
        DateTime sTime =
            getDateFromString(s["time"].toString(), formatter: 'HH:mm:ss');
        serverFullTime = DateTime(sDate.year, sDate.month, sDate.day,
            sTime.hour, sTime.minute, sTime.second);
        serverDate = s["date"].toString();
        serverTime = s["time"].toString();
        MyApiCallForGetTodayEntry(context: context);
      },
      failureCallback: (status, message) {
        myHasData.value = true;
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        //print(" error");
        //print(status);
      },
    );
  }

  MyApiCallForGetTodayEntry(
      {required BuildContext context, bool isFromInit = false}) {
    myHasData.value = false;
    hasData.value = false;
    Map<String, dynamic> dict = {};
    dict["email"] = box.read(StringConstants.userEmailAddress);
    dict["date"] = (!isNullEmptyOrFalse(serverDate))
        ? serverDate
        : DateFormat('yyyy-MM-dd').format(DateTime.now());
    dict["data_st"] = "today_entry";
    FormData formData = FormData.fromMap(dict);
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.clockInOut,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        //  print("MyApiCallForGetTodayEntry Done");

        clockInOutModel = ClockInOutModel.fromJson(jsonDecode(response));
        // myHasData.value = true;
        MyApiCallApiForClockInOrOutStatus(context: context);
        hasData.value = true;
      },
      failureCallback: (status, message) {
        myHasData.value = true;
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
  }

  MyApiCallApiForClockInOrOutStatus({required BuildContext context}) {
    myHasData.value = false;
    Map<String, dynamic> dict = {};
    dict["email"] = box.read(StringConstants.userEmailAddress);
    dict["date"] = (!isNullEmptyOrFalse(serverDate))
        ? serverDate
        : DateFormat('yyyy-MM-dd').format(DateTime.now());
    dict["data_st"] = "last_record";
    FormData formData = FormData.fromMap(dict);
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.clockInOut,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) async {
        Map<String, dynamic> temp = jsonDecode(response);
        // print(
        //     "MyApiCallApiForClockInOrOutStatus Done := Response := ${temp["data"].runtimeType} === > isNull := ${isNullEmptyOrFalse(temp["data"])}");
        if (isNullEmptyOrFalse(temp["data"])) {
          myHasData.value = true;
        } else {
          CheckInOutModel checkInOutModel =
              CheckInOutModel.fromJson(jsonDecode(response));
          if (checkInOutModel != null &&
              !isNullEmptyOrFalse(checkInOutModel.data)) {
            if (checkInOutModel.data!.st == "in") {
              webClockIn.value = true;
              DateTime a = getDateFromString(
                  clockInOutModel!.data!.last.time.toString(),
                  formatter: 'HH:mm:ss');
              DateTime b = DateTime(serverFullTime.year, serverFullTime.month,
                  serverFullTime.day, a.hour, a.minute, a.second);
              totalSecond = int.parse(checkInOutModel.data!.total.toString());
              Duration diff = serverFullTime.difference(b);
              myDuration = Duration(
                  seconds: (diff.inSeconds +
                      int.parse(checkInOutModel.data!.total.toString())));
              startTimer();
            } else {
              webClockIn.value = false;

              Duration diff = Duration(
                  seconds: int.parse(checkInOutModel.data!.total.toString()));
              totalSecond = int.parse(checkInOutModel.data!.total.toString());
              hours.value = strDigits(diff.inHours.remainder(24));
              minutes.value = strDigits(diff.inMinutes.remainder(60));
              second.value = strDigits(diff.inSeconds.remainder(60));
              myHasData.value = true;
            }
          } else {
            myHasData.value = false;
          }
        }
      },
      failureCallback: (status, message) {
        myHasData.value = true;
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
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
    //
    //  print(DateFormat('HH:mm:ss').format(DateTime.now()));
    dict["date"] = (!isNullEmptyOrFalse(serverDate))
        ? serverDate
        : DateFormat('yyyy-MM-dd').format(DateTime.now());
    if ((webClockIn.value)) {
      if (clockInOutModel != null) {
        DateTime a = getDateFromString(
            clockInOutModel!.data!.last.time.toString(),
            formatter: 'HH:mm:ss');
        DateTime b = DateTime(serverFullTime.year, serverFullTime.month,
            serverFullTime.day, a.hour, a.minute, a.second);

        num totalSec = serverFullTime.difference(b).inSeconds +
            num.parse(clockInOutModel!.data!.last.total.toString());
        dict["total"] = "$totalSec";
      } else {
        dict["total"] = "$totalSecond";
      }
    } else {
      dict["total"] = "$totalSecond";
    }
    dict["data_st"] = "at_entry";
    // dict["pass"] = passController.value.text;
    FormData data = FormData.fromMap(dict);
    // print(dict);
    // print(data);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.clockInOut,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        // print(response);

        callApiForGetTodayEntry(context: Get.context!, isFromButton: true);
        if (jsonDecode(response)["status"] == "1") {
          webClockIn.toggle();
          if (!webClockIn.value) {
            stopTimer();
            callApiForClockInOrOutStatus(
                context: Get.context!, isFromButton: true);
          } else {
            callApiForClockInOrOutStatus(
                context: Get.context!, isFromButton: true);
          }
          getAttendanceDetails(context: Get.context!);
        }
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);

        // print(" error");
        //
        // print(status);
      },
    );
  }

  callApiForClockInOrOutStatus(
      {required BuildContext context, bool isFromButton = false}) async {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};

    dict["email"] = box.read(StringConstants.userEmailAddress);
    await callApiForGetServerTime(context: context, isFromButton: true);

    // dict["date"] = DateFormat('yyyy-MM-dd').format(DateTime.now());
    dict["date"] = (!isNullEmptyOrFalse(serverDate))
        ? serverDate
        : DateFormat('yyyy-MM-dd').format(DateTime.now());

    dict["data_st"] = "last_record";
    FormData data = FormData.fromMap(dict);
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.clockInOut,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) async {
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        await callApiForGetServerTime(
            context: Get.context!, isFromButton: true);

        CheckInOutModel checkInOutModel =
            CheckInOutModel.fromJson(jsonDecode(response));
        if (checkInOutModel != null &&
            !isNullEmptyOrFalse(checkInOutModel.data)) {
          if (checkInOutModel.data!.st == "in") {
            webClockIn.value = true;
            DateTime a = getDateFromString(
                clockInOutModel!.data!.last.time.toString(),
                formatter: 'HH:mm:ss');
            DateTime b = DateTime(serverFullTime.year, serverFullTime.month,
                serverFullTime.day, a.hour, a.minute, a.second);
            // DateTime now = getDateFromString(
            //     checkInOutModel.data!.time.toString(),
            //     formatter: 'HH:mm:ss');
            totalSecond = int.parse(checkInOutModel.data!.total.toString());
            // print("now" + b.toString());
            await callApiForGetServerTime(context: Get.context!);
            Duration diff = serverFullTime.difference(b);
            // print(diff.inSeconds.toString() + "didd");
            //  print(diff.inSeconds.toString() + "adsa");
            myDuration = Duration(
                seconds: (diff.inSeconds +
                    int.parse(checkInOutModel.data!.total.toString())));
            startTimer();
          } else {
            webClockIn.value = false;
            // DateTime now = getDateFromString(
            //     checkInOutModel.data!.time.toString(),
            //     formatter: 'HH:mm:ss');
            // print("nowb" + now.toString());

            Duration diff = Duration(
                seconds: int.parse(checkInOutModel.data!.total.toString()));
            totalSecond = int.parse(checkInOutModel.data!.total.toString());
            hours.value = strDigits(diff.inHours.remainder(24));
            minutes.value = strDigits(diff.inMinutes.remainder(60));
            second.value = strDigits(diff.inSeconds.remainder(60));
          }
        }
        // print(response);
      },
      failureCallback: (status, message) {
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);

        // print(" error");
        //
        // print(status);
      },
    );
  }

  callApiForGetTodayEntry(
      {required BuildContext context, bool isFromButton = false}) async {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};
    hasData.value = false;
    //print("aa" + box.read(StringConstants.userEmailAddress));
    dict["email"] = box.read(StringConstants.userEmailAddress);
    // print(box.read(StringConstants.userEmailAddress));
    await callApiForGetServerTime(context: context, isFromButton: true);
    // dict["date"] = DateFormat('yyyy-MM-dd').format(DateTime.now());
    dict["date"] = (!isNullEmptyOrFalse(serverDate))
        ? serverDate
        : DateFormat('yyyy-MM-dd').format(DateTime.now());

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
        //print(response);
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        clockInOutModel = ClockInOutModel.fromJson(jsonDecode(response));
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

  callApiForGetServerTime(
      {required BuildContext context, bool isFromButton = false}) {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};

    FormData data = FormData.fromMap(dict);
    //print(dict);
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
        DateTime sDate =
            getDateFromString(s["date"].toString(), formatter: 'yyyy-MM-dd');
        DateTime sTime =
            getDateFromString(s["time"].toString(), formatter: 'HH:mm:ss');
        serverFullTime = DateTime(sDate.year, sDate.month, sDate.day,
            sTime.hour, sTime.minute, sTime.second);
        serverDate = s["date"].toString();
        serverTime = s["time"].toString();
        // print(response);
      },
      failureCallback: (status, message) {
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);

        // print(" error");
        //
        // print(status);
      },
    );
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  getAttendanceDetails({required BuildContext context}) async {
    dataEntryList.clear();
    dataList.clear();
    attendanceDetailsList.clear();
    monthTotalTime.value = 0;
    hasData.value = false;
    Map<String, dynamic> dict = {};
    if (selectedMonth.value.month == DateTime.now().month) {
      lastDateOfMonth = DateTime.now();
    }
    dict["email"] = box.read(StringConstants.userEmailAddress);
    dict["date1"] =
        "${selectedMonth.value.year}-${selectedMonth.value.month}-01";
    dict["date2"] =
        "${selectedMonth.value.year}-${selectedMonth.value.month}-${lastDateOfMonth.day}";
    FormData formData = FormData.fromMap(dict);
    NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.dateWiseData,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) async {
        hasData.value = true;
        List res = jsonDecode(response);
        if (!isNullEmptyOrFalse(res)) {
          res.forEach((element) {
            AttendanceDetailsModel attendanceDetailsModel =
                AttendanceDetailsModel.fromJson(element);
            dataList.add(attendanceDetailsModel);
          });
          attendanceDetailsList.addAll(dataList);
          if (!isNullEmptyOrFalse(attendanceDetailsList)) {
            dataList.clear();
            attendanceDetailsList.forEach((element) {
              if (!isNullEmptyOrFalse(element.data)) {
                dataList.add(element);
                if (!isNullEmptyOrFalse(element.data!.last.total)) {
                  monthTotalTime.value = monthTotalTime.value +
                      int.parse(element.data!.last.total!);
                }
                // print(
                //     " Main : = ${monthTotalTime.value} MainTimne: = ${getTotalTime(monthTotalTime.value)}, total : = ${element.data!.last.total}  Seconds := ${getTotalTime(int.parse(element.data!.last.total!))}");
              }
            });
            log(dataList.length.toString());
            if (selectedIndexForEntry.value == 0) {
              selectedIndexForEntry.value = attendanceDetailsList.length - 1;

              if (!isNullEmptyOrFalse(attendanceDetailsList.last.data)) {
                totalTime.value = getTotalTime(
                    int.parse(attendanceDetailsList.last.data!.last.total!));
              }
            } else {
              totalTime.value = getTotalTime(int.parse(
                  attendanceDetailsList[selectedIndexForEntry.value]
                      .data!
                      .last
                      .total!));
            }
            counter.value = 0;
            attendanceDetailsList.forEach((element) {
              if (isNullEmptyOrFalse(element.data)) {
                DateTime now = DateTime.now();
                if ((getDateFromString(element.date!,
                            formatter: "yyyy-MM-dd") !=
                        DateTime(now.year, now.month, now.day)) &&
                    (getDateFromString(element.date!, formatter: "yyyy-MM-dd")
                            .weekday !=
                        7)) {
                  bool isDateContains = false;

                  if (isDateContains) {
                    counter.value++;
                  }
                }
              }
            });
          }
          if (!isNullEmptyOrFalse(attendanceDetailsList)) {
            attendanceDetailsList.forEach((element) {
              element.data!.forEach((element) {
                dataEntryList.add(element);
              });
            });
          }

          log(dataEntryList.length.toString());
          await getChartData();
        }
      },
      failureCallback: (status, message) {
        hasData.value = true;
        app
            .resolve<CustomDialogs>()
            .getDialog(title: "Failed", desc: "Something went wrong.");
        //print(" error ");
      },
    );
  }

  getChartData() {
    chartData.clear();
    dataEntryList.forEach((element) {
      chartData.add(ChartSampleData(
          x: element.date!,
          y: Duration(seconds: int.parse(element.total!)).inHours));
    });
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
    // print(myDuration!.inSeconds + reduceSecondsBy);
    totalSecond = (myDuration!.inSeconds + reduceSecondsBy);

    if (seconds < 0) {
      countdownTimer!.cancel();
      myHasData.value = true;
    } else {
      myDuration = Duration(seconds: seconds);
      //print("myDuration" + myDuration!.inMinutes.toString());
      hours.value = strDigits(myDuration!.inHours.remainder(24));
      minutes.value = strDigits(myDuration!.inMinutes.remainder(60));
      second.value = strDigits(myDuration!.inSeconds.remainder(60));
      myHasData.value = true;
    }
  }

  String strDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

String getTotalTime(int sec) {
  Duration diff = Duration(seconds: sec);
  // totalSecond = int.parse(checkInOutModel.data!.total.toString());
  String h = strDigits(diff.inHours.remainder(24));
  String mm = strDigits(diff.inMinutes.remainder(60));
  String ss = strDigits(diff.inSeconds.remainder(60));
  return '$h : $mm : $ss';
}

String strDigits(int n) {
  return n.toString().padLeft(2, '0');
}
