part of 'app_pages.dart';

abstract class AppRoutes {
  static const mainView = "/";
  static const detail = '/detail';
  static const animation = '/animation';
  static const interleavedAnimation = '/interleavedAnimation';
  static const transitionAnimation = '/transitionAnimation';
}

extension RoutesExtension on String {
  String toRoute() => '/${toLowerCase()}';
}
