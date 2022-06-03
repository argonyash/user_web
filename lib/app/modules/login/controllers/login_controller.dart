import 'package:argon_user/Constants/api_constants.dart';
import 'package:argon_user/Constants/string_constants.dart';
import 'package:argon_user/Models/LogInModel.dart';
import 'package:argon_user/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';

import '../../../../Utilities/customeDialogs.dart';
import '../../../data/network_client.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;
  RxBool isChecked = false.obs;
  RxBool passwordVisible = true.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    if (box.read(StringConstants.isRemember) != null) {
      if (box.read(StringConstants.isRemember) == true) {
        emailController.value.text = box.read(StringConstants.userEmailAddress);
        passController.value.text = box.read(StringConstants.userPassword);
        isChecked.value = box.read(StringConstants.isRemember);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  callApiForLoginUser({
    required BuildContext context,
  }) {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    GetStorage box = GetStorage();
    dict["email"] = emailController.value.text;
    dict["pass"] = passController.value.text;
    FormData data = FormData.fromMap(dict);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.logIn,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: data,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        LogInModel loginModel = LogInModel.fromJson(response);

        if (loginModel.status == 0) {
          app.resolve<CustomDialogs>().getDialog(
              title: "Failed", desc: "No any account found for this account.");
        } else if (loginModel.status == 2) {
          Get.offAndToNamed(Routes.HOME);
          box.write(StringConstants.isUserLogIn, true);
          box.write(StringConstants.userName, loginModel.name.toString());
          box.write(StringConstants.role, loginModel.role.toString());
          box.write(StringConstants.role, loginModel.role.toString());
          box.write(StringConstants.userImage, loginModel.img.toString());
        } else {
          app
              .resolve<CustomDialogs>()
              .getDialog(title: "Failed", desc: "Enter valid password");
        }
        print(response);
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
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
