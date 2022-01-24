import 'package:get/get.dart';
import 'package:getx_demo/home_page/home_view.dart';
import 'package:getx_demo/home_page/home_binding.dart';
import 'package:getx_demo/nobind_page/nobind_view.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.MAINVIEW,
      page: () => const HomePage(),
      // 提前绑定好
      binding: HomeBinding(),
    ),
    GetPage(
      // 在界面中手动绑定
      name: AppRoutes.DETAIL,
      page: () => const NobindPage(),
    ),
  ];
}
