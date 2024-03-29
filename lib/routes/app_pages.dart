import 'package:get/get.dart';
import 'package:getx_demo/animation/Interleaved_animation.dart';
import 'package:getx_demo/animation/animation_binding.dart';
import 'package:getx_demo/animation/animation_view.dart';
import 'package:getx_demo/home_page/home_view.dart';
import 'package:getx_demo/home_page/home_binding.dart';
import 'package:getx_demo/nobind_page/nobind_view.dart';

import '../animation/transition_animation/transition_animation.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.mainView,
      page: () => const HomePage(),
      // 提前绑定好
      binding: HomeBinding(),
    ),
    GetPage(
      // 在界面中手动绑定
      name: AppRoutes.detail,
      page: () => const NobindPage(),
    ),
    GetPage(
      name: AppRoutes.animation,
      page: () => const AnimationPage(),
      binding: AnimationBinding(),
    ),
    GetPage(
      name: AppRoutes.interleavedAnimation,
      page: () => const InterleavedAnimationPage(),
    ),
    GetPage(
      name: AppRoutes.transitionAnimation,
      page: () => const TransitionAnimationPage(),
    ),
  ];
}
