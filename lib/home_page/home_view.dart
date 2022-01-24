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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${logic.counterText} ${logic.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => logic.gotoNextScreen(),
              icon: const Icon(Icons.pets_outlined),
              label: const Text('跳转到下一个界面'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.addCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
