// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, prefer_is_empty

import 'package:get/get.dart';

class UserModel {
  String name;
  int age;

  UserModel({required this.name, required this.age});

  @override
  String toString() {
    return 'age: $age name:$name';
  }
}

class NobindLogic extends GetxController {
  var name = '默认title'.obs;
  var desc = '默认的描述'.obs;
  // 普通数据监听
  var isLogin = false.obs;
  var counter = 0.obs;
  var counterText = '默认值'.obs;
  // 监听模型
  var model = UserModel(name: 'rock', age: 120).obs;
  // 数组的监听
  var list = List.empty().obs;

  // 组合使用 当其中某一个值更新的时候，这个值也会更新
  String get allArgData => '${name.value} ${desc.value}';

  // 所有数据的集合
  String get allData {
    var lastValue = list.length > 0 ? list.last : '';
    return '${counter.value} ${counterText.value} ${isLogin.value} ${isLogin.value} ${model.value.name} ${model.value.age} \n list的长度：$lastValue';
  }

  var count1 = 0.obs;

  void changeCount() {
    count1++;
  }

  late Worker everObject;
  late Worker onceObject;
  late Worker debounceObject;
  late Worker intervalObject;

  void cancelWorker() {
    // 取消worker
    everObject.dispose();
    onceObject.dispose();
    debounceObject.dispose();
    intervalObject.dispose();
  }

  @override
  void onReady() {
    super.onReady();

    ///每次`count1`变化时调用。
    everObject = ever(count1, (_) => print("$_ has been changed"));

    ///只有在变量$_第一次被改变时才会被调用。
    onceObject = once(count1, (_) => print("$_ was changed once"));

    ///防DDos - 每当用户停止输入1秒时调用，输出的最后时刻的值
    debounceObject = debounce(
      count1,
      (_) => print("debounce $_"),
      time: const Duration(seconds: 1),
    );

    ///忽略1秒内的所有变化，输出的第一次变化的值(1秒内)
    intervalObject = interval(
      count1,
      (_) => print("interval $_"),
      time: const Duration(seconds: 1),
    );
  }

  @override
  void onInit() {
    // 处理传递过来的值
    name.value = Get.arguments['title'];
    desc.value = Get.arguments['des'];

    super.onInit();
  }

  void back() {
    // 传参
    Get.back(result: '这个数据是上个界面返回的');
    // 不传参
    // Get.back();
  }

  void changeData() {
    // 如果 "hasToken "是 "false"，"isLogged "就不会有任何变化，所以 "ever() "永远不会被调用。 为了避免这种问题，_observable_的第一次变化将总是触发一个事件，即使它包含相同的.value。
    // 如果你想删除这种行为，你可以使用： isLogged.firstRebuild = false;
    // 必须在方法体中调用
    isLogin.firstRebuild = false;
    isLogin.value = true;

    // 可以这样
    counter.value = 100;
    // 也可以这样
    counter++;

    counterText.value = '不在是默认值';

    // 使用方式
    // model.value.name model.value.age
    // model().age  model().name
    print(model().age);
    print(model.value.name);
    // 更新方式1
    model.update((val) {
      // name 不能定义为final const
      val?.name = '天鹰';
      // 需要加？防止为空
      val?.age = 18;
    });
    // 更新方式2
    model(UserModel(name: '天启', age: 1002));

    // 正常增加数据即可
    // 正常使用对应的值即可
    list.add('<+ ${list.length} +>');
  }
}
