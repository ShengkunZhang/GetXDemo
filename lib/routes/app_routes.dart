part of 'app_pages.dart';

abstract class AppRoutes {
  static const MAINVIEW = "/";
  static const DETAIL = '/detail';
  static const animation = '/animation';
  static const interleavedAnimation = '/interleavedAnimation';
}

extension RoutesExtension on String {
  String toRoute() => '/${toLowerCase()}';
}
