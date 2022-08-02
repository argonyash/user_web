import 'dart:convert';

import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:argon_user/Models/AttandanceLIstModel.dart';
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
  Rx<PickerDateRange> range =
      PickerDateRange(DateTime.now(), DateTime.now()).obs;
  Rx<TextEditingController> reasonController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<Attandance> attandanceList = RxList<Attandance>([]);
  RxBool hasData = false.obs;
  RxBool applyLeave = false.obs;

  final count = 1.obs;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      callApiForGetLeave(context: Get.context!, isFromButton: true);
    });
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
    dict["reason"] = reasonController.value.text;
    dict["date1"] = DateFormat('yyyy-MM-dd').format(range.value.startDate!);
    if (range.value.endDate != null) {
      dict["date2"] = DateFormat('yyyy-MM-dd').format(range.value.endDate!);
    } else {
      dict["date2"] = DateFormat('yyyy-MM-dd').format(range.value.startDate!);
    }

    dict["name"] = box.read(StringConstants.userName);

    FormData data = FormData.fromMap(dict);

    //hasData.value = false;

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.leave,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        reasonController.value.clear();
        if (!isFromButton) {
          app.resolve<CustomDialogs>().hideCircularDialog(context);
        }
        callApiForGetLeave(context: Get.context!, isFromButton: true);
      },
      failureCallback: (status, message) {
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
        attandanceList.clear();
        if (!isNullEmptyOrFalse(attandanceListModel.data)) {
          List<Attandance> reverse = [];
          reverse.addAll(attandanceListModel.data!);

          attandanceList.addAll(reverse.reversed.toList());
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

  callApiForDeleteLeave({
    required BuildContext context,
    bool isFromButton = false,
    String? id,
  }) {
    FocusScope.of(context).unfocus();
    if (!isFromButton) {
      app.resolve<CustomDialogs>().showCircularDialog(context);
    }
    Map<String, dynamic> dict = {};

    // dict["email"] = box.read(StringConstants.userEmailAddress);
    // dict["name"] = box.read(StringConstants.userName);
    dict["select_op"] = "delete_leave";
    dict["id"] = id!;
    // dict["date_from"] = DateFormat('yyyy-MM-dd').format(range.startDate!);
    // if (range.endDate != null) {
    //   dict["date_to"] = DateFormat('yyyy-MM-dd').format(range.endDate!);
    // }

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
        callApiForGetLeave(context: Get.context!, isFromButton: true);

        //List data = jsonDecode(response) as List;
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
  void onClose() {}
  void increment() => count.value++;
}
