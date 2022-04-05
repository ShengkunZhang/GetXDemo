import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Demo'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Center(
              child: Obx(() => Text(
                    '${logic.counterText} ${logic.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  )),
            );
          } else if (index == 1) {
            return ElevatedButton.icon(
              onPressed: () => logic.gotoNextScreen(),
              icon: const Icon(Icons.pets_outlined),
              label: const Text('跳转到下一个界面'),
            );
          } else if (index == 2) {
            return ElevatedButton.icon(
              onPressed: () => logic.gotoAnimation(),
              icon: const Icon(Icons.animation),
              label: const Text('去动画界面'),
            );
          }
          return Container();
        },
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.addCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
