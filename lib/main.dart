import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_demo/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用GetMaterialApp 而非 MaterialApp
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 路由列表
      getPages: AppPages.routes,
      // 初始启动页
      initialRoute: AppRoutes.mainView,
    );
  }
}
