import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../Constants/api_constants.dart';
import '../../../../Constants/string_constants.dart';
import '../../../../Utilities/customeDialogs.dart';
import '../../../../main.dart';
import '../../../data/network_client.dart';

class LeaveController extends GetxController {
  //TODO: Implement LeaveController
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PickerDateRange range = PickerDateRange(DateTime.now(), DateTime.now());
  Rx<TextEditingController> reasonController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  callApiForApplyLeaveEntry(
      {required BuildContext context, bool isFromButton = false}) {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};

    dict["email"] = box.read(StringConstants.userEmailAddress);
    dict["select_op"] = "leave_entry";
    // dict["email"] = "ajay01@gmail.com";

    // dict["date"] = DateFormat('yyyy-MM-dd').format(DateTime.now());
    dict["date_from"] = DateFormat('yyyy-MM-dd').format(range.startDate!);
    if (range.endDate != null) {
      dict["date_to"] = DateFormat('yyyy-MM-dd').format(range.endDate!);
    }
    // dict["date2"] =
    //     DateFormat('yyyy-MM-dd').format(getLastDateOfMonth(now.value));
    // dict["date"] = DateFormat('yyyy-MM-dd').format(DateTime.now());

    FormData data = FormData.fromMap(dict);
    print(dict);
    print(data);
    //hasData.value = false;

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.leave,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        print(response);

        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }

        List data = jsonDecode(response) as List;

        print(response);
      },
      failureCallback: (status, message) {
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);

        print(" error");

        print(status);
      },
    );
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
