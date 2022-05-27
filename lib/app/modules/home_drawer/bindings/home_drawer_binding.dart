import 'package:get/get.dart';

import '../controllers/home_drawer_controller.dart';

class HomeDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDrawerController>(
      () => HomeDrawerController(),
    );
  }
}
