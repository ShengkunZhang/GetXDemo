part of 'app_pages.dart';

abstract class AppRoutes {
  static const MAINVIEW = "/";
  static const DETAIL = '/detail';
}

extension RoutesExtension on String {
  String toRoute() => '/${toLowerCase()}';
}
