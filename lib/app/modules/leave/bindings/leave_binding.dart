import 'package:get/get.dart';

import '../controllers/leave_controller.dart';

class LeaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveController>(
      () => LeaveController(),
    );
  }
}
