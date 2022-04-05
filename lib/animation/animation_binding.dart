import 'package:get/get.dart';

import 'animation_logic.dart';

class AnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimationLogic());
  }
}
