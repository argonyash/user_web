import 'package:argon_user/Constants/string_constants.dart';
import 'package:argon_user/Models/UserProfileModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';

import '../../../../Constants/api_constants.dart';
import '../../../../Utilities/customeDialogs.dart';
import '../../../../main.dart';
import '../../../data/network_client.dart';

class UserProfileController extends GetxController {
  final count = 0.obs;
  RxBool hasData = false.obs;
  UserProfileModel? userProfileModel;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      callApiForGetUserDetail(context: Get.context!);
    });
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
    // GetStorage box = GetStorage();
    print(box.read(StringConstants.userEmailAddress));
    dict["email"] = box.read(StringConstants.userEmailAddress);
    FormData data = FormData.fromMap(dict);
    print(dict);

    print(data);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.userData,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        print(response);
        hasData.value = true;
        UserProfileModelData userProfile =
            UserProfileModelData.fromJson(response);
        userProfileModel = userProfile.data;
        print(userProfileModel!.name.toString() + "sasa");
        print(response);
      },
      failureCallback: (status, message) {
        hasData.value = true;

        print(" error");

        print(status);
      },
    );
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
