// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:getx_demo/routes/app_navigator.dart';
import 'package:getx_demo/routes/app_pages.dart';

class HomeLogic extends GetxController {
  var counter = 0.obs;
  var counterText = '默认值'.obs;
  void addCounter() => counter++;

  /// 第一种接受方式
  void gotoNextScreen1() async {
    // 跳转传值 且 接受返回的值
    var result = await AppNavigator.startWithName(
      named: AppRoutes.detail,
      info: {
        'title': '你是谁',
        'des': '这是一个描述信息',
      },
    );
    // 将返回值作为新的显示值
    counterText.value = result ?? '默认值';
  }

  /// 第二种接受方式
  void gotoNextScreen() {
    // 跳转传值 且 接受返回的值
    var result = AppNavigator.startWithName(
      named: AppRoutes.detail,
      info: {
        'title': '你是谁',
        'des': '这是一个描述信息',
      },
    );

    result?.then((value) {
      // 将返回值作为新的显示值
      counterText.value = value ?? '默认值';
    });
  }

  void gotoAnimation() {
    AppNavigator.startWithName(
      named: AppRoutes.animation,
      info: {},
    );
  }

  void gotoInterleavedAnimation() {
    AppNavigator.startWithName(
      named: AppRoutes.interleavedAnimation,
      info: {},
    );
  }

  void gotoTransitionAnimation() {
    AppNavigator.startWithName(
      named: AppRoutes.transitionAnimation,
      info: {},
    );
  }
}
