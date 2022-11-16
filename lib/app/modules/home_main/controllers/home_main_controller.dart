import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:argon_user/Constants/string_constants.dart';
import 'package:argon_user/app/modules/attandance/views/attandance_view.dart';
import 'package:argon_user/app/modules/home/views/home_view.dart';
import 'package:argon_user/app/modules/leave/views/leave_view.dart';
import 'package:argon_user/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class HomeMainController extends GetxController {
  //TODO: Implement HomeMainController
  Widget? currentWidget;
  final count = 0.obs;
  RxInt index = 0.obs;
  @override
  void onInit() {
    print("Box Mail := ${box.read(StringConstants.userEmailAddress)}");
    if (isNullEmptyOrFalse(box.read(StringConstants.userEmailAddress)) ||
        isNullEmptyOrFalse(box.read(StringConstants.isUserLogIn))) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        currentWidget = HomeView();
      });
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
