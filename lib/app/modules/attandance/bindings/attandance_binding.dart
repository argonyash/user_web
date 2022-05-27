import 'package:get/get.dart';

import '../controllers/attandance_controller.dart';

class AttandanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttandanceController>(
      () => AttandanceController(),
    );
  }
}
