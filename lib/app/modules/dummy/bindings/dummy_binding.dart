import 'package:get/get.dart';

import '../controllers/dummy_controller.dart';

class DummyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DummyController>(
      () => DummyController(),
    );
  }
}
