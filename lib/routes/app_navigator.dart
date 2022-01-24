import 'package:get/get.dart';
import 'app_pages.dart';

class AppNavigator {
  // 传递值且接受返回值
  static Future<T?>? startWithName<T>({required named, required dynamic info}) {
    return Get.toNamed(named, arguments: info);
  }

  // static void startMinePage() {
  //   Get.toNamed(AppRoutes.MINE_VIEW);
  // }

  // static void startLaunch() {
  //   Get.offAllNamed(AppRoutes.LAUNCH);
  // }

  // static void startRegisterVerifyPhoneOrEmail({
  //   String? email,
  //   String? phoneNumber,
  //   String? areaCode,
  // }) {
  //   Get.toNamed(AppRoutes.REGISTER_VERIFY_PHONE, arguments: {
  //     'phoneNumber': phoneNumber,
  //     'areaCode': areaCode,
  //     'email': email,
  //   });
  // }

  // static void startBackMain() {
  //   Get.until((route) => Get.currentRoute == AppRoutes.HOME);
  // }

  // static Future<T?>? startChat<T>({
  //   int type = 0,
  //   String? uid,
  //   String? gid,
  //   String? name,
  //   String? icon,
  //   String? draftText,
  // }) {
  //   var arguments = {
  //     'uid': uid,
  //     'gid': gid,
  //     'name': name,
  //     'icon': icon,
  //     'draftText': draftText,
  //   };
  //   switch (type) {
  //     case 0:
  //       return Get.toNamed(AppRoutes.CHAT, arguments: arguments);

  //     case 1:
  //       return Get.offNamedUntil(
  //         AppRoutes.CHAT,
  //         (route) => route.settings.name == AppRoutes.HOME,
  //         arguments: arguments,
  //       );

  //     default:
  //       return Get.offNamed(AppRoutes.CHAT, arguments: arguments);
  //   }
  // }

  // static Future<T?>? startSelectContacts<T>({
  //   required dynamic action,
  //   dynamic defaultCheckedUidList,
  //   dynamic excludeUidList,
  // }) {
  //   return Get.toNamed<T>(
  //     AppRoutes.SELECT_CONTACTS,
  //     arguments: {
  //       'action': action,
  //       'defaultCheckedUidList': defaultCheckedUidList,
  //       'excludeUidList': excludeUidList,
  //     },
  //   );
  // }
}
