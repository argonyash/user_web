import 'package:argon_user/app/modules/attandance/views/attandance_view.dart';
import 'package:argon_user/app/modules/home/views/home_view.dart';
import 'package:argon_user/app/modules/leave/views/leave_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeMainController extends GetxController {
  //TODO: Implement HomeMainController
  Widget? currentWidget;
  final count = 0.obs;
  RxInt index = 0.obs;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      currentWidget = HomeView();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
