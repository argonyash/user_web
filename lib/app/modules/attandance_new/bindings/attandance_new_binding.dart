import 'package:get/get.dart';

import '../controllers/attandance_new_controller.dart';

class AttandanceNewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttandanceNewController>(
      () => AttandanceNewController(),
    );
  }
}
