import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'nobind_logic.dart';

class NobindPage extends StatelessWidget {
  const NobindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final NobindLogic logic = Get.put(NobindLogic());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => Text(
                logic.allArgData,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Obx(
              () => Text(
                logic.allData,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => logic.back(),
              icon: const Icon(Icons.pets_outlined),
              label: const Text('返回到上一个界面'),
            ),
            ElevatedButton.icon(
              onPressed: () => logic.changeData(),
              icon: const Icon(Icons.ice_skating),
              label: const Text('改变当前的数据'),
            ),
            ElevatedButton.icon(
              onPressed: () => logic.changeCount(),
              icon: const Icon(Icons.ice_skating),
              label: const Text('改变Counter1的值'),
            ),
          ],
        ),
      ),
    );
  }
}
