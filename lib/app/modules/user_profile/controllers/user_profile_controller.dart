import 'dart:convert';

import 'package:argon_user/Constants/string_constants.dart';
import 'package:argon_user/Models/UserProfileModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';

import '../../../../Constants/api_constants.dart';
import '../../../../Constants/sizeConstant.dart';
import '../../../../Utilities/customeDialogs.dart';
import '../../../../main.dart';
import '../../../data/network_client.dart';
import '../../../routes/app_pages.dart';

class UserProfileController extends GetxController {
  final count = 0.obs;
  RxBool hasData = false.obs;
  UserProfileModel? userProfileModel;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    print("Box Mail := ${box.read(StringConstants.userEmailAddress)}");
    if (isNullEmptyOrFalse(box.read(StringConstants.userEmailAddress)) ||
        isNullEmptyOrFalse(box.read(StringConstants.isUserLogIn))) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        callApiForGetUserDetail(context: Get.context!);
      });
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  callApiForGetUserDetail({
    required BuildContext context,
  }) {
    FocusScope.of(context).unfocus();
    // app.resolve<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};

    dict["email"] = box.read(StringConstants.userEmailAddress);
    FormData data = FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.userData,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        hasData.value = true;
        UserProfileModelData userProfile =
            UserProfileModelData.fromJson(jsonDecode(response));
        userProfileModel = userProfile.data;
      },
      failureCallback: (status, message) {
        hasData.value = true;
      },
    );
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
