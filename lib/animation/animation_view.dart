import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animation_logic.dart';

//  1.Animation: 抽象类
//    * 监听动画值的改变
//    * 监听动画状态的改变
//    * value
//    * status
//  2.AnimationController继承自Animation
//    * vsync: 同步信号(this -> with SingleTickerProviderStateMixin)
//    * forward(): 向前执行动画
//    * reverse(): 反转执行动画
//  3.CurvedAnimation:
//    * 作用: 设置动画执行的速率(速度曲线)
//  4.Tween: 设置动画执行的value范围
//    * begin: 开始值
//    * end: 结束值

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AnimationLogic>();
    final state = Get.find<AnimationLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('动画界面'),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(
              child: AnimationWidget(),
            ),
            Expanded(
              child: AnimationWidgetTwo(),
            ),
            Expanded(
              child: AnimationWidgetThree(),
            ),
          ],
        ),
      ),
    );
  }
}

/// 使用 build
class AnimationWidgetThree extends StatefulWidget {
  const AnimationWidgetThree({Key? key}) : super(key: key);

  @override
  _AnimationWidgetThreeState createState() => _AnimationWidgetThreeState();
}

/// 必须继承于 SingleTickerProviderStateMixin
class _AnimationWidgetThreeState extends State<AnimationWidgetThree>
    with SingleTickerProviderStateMixin {
  // 创建AnimationController
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _sizeAnim;

  void play() {
    /// 动画的值如果是从 0 - 1
    /// 动画最开始处于 dismissed 此时值是0 此时应该是向前执行动画 forward
    /// 动画处于 completed 此时值是1 此时应该是反转执行动画 reverse
    /// 动画处于 向前 与 反转 两个状态就会处于无线循环状态
    if (_controller.isAnimating) {
      // 如果在动画中则停止
      _controller.stop();
    } else if (_controller.status == AnimationStatus.forward) {
      // 如果在停止状态且状态是向前，则继续向前
      _controller.forward();
    } else if (_controller.status == AnimationStatus.reverse) {
      // 如果在停止状态且状态是反转，则继续反转
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.completed) {
      // 如果在停止状态且状态是完成状态，则反转
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.dismissed) {
      // 如果在停止状态且状态是初始状态，则向前
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // 2.设置Curve的值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 3.Tween
    _sizeAnim = Tween(begin: 50.0, end: 150.0).animate(_animation);

    // 监听动画的状态改变 让动画一直执行的关键
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, Widget? child) {
              return Icon(
                Icons.favorite,
                color: Colors.deepOrange,
                size: _sizeAnim.value,
              );
            },
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: FloatingActionButton(
            onPressed: () => play(),
            tooltip: 'Increment',
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.play_arrow_sharp),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    /// 注意回收这个
    _controller.dispose();
    super.dispose();
  }
}

class AnimationWidgetTwo extends StatefulWidget {
  const AnimationWidgetTwo({Key? key}) : super(key: key);

  @override
  _AnimationWidgetTwoState createState() => _AnimationWidgetTwoState();
}

/// 必须继承于 SingleTickerProviderStateMixin
class _AnimationWidgetTwoState extends State<AnimationWidgetTwo>
    with SingleTickerProviderStateMixin {
  // 创建AnimationController
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _sizeAnim;

  void play() {
    /// 动画的值如果是从 0 - 1
    /// 动画最开始处于 dismissed 此时值是0 此时应该是向前执行动画 forward
    /// 动画处于 completed 此时值是1 此时应该是反转执行动画 reverse
    /// 动画处于 向前 与 反转 两个状态就会处于无线循环状态
    if (_controller.isAnimating) {
      // 如果在动画中则停止
      _controller.stop();
    } else if (_controller.status == AnimationStatus.forward) {
      // 如果在停止状态且状态是向前，则继续向前
      _controller.forward();
    } else if (_controller.status == AnimationStatus.reverse) {
      // 如果在停止状态且状态是反转，则继续反转
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.completed) {
      // 如果在停止状态且状态是完成状态，则反转
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.dismissed) {
      // 如果在停止状态且状态是初始状态，则向前
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // 2.设置Curve的值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 3.Tween
    _sizeAnim = Tween(begin: 50.0, end: 150.0).animate(_animation);

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HYAnimatedIcon(anim: _sizeAnim),
        Positioned(
          right: 0,
          bottom: 0,
          child: FloatingActionButton(
            onPressed: () => play(),
            tooltip: 'Increment',
            child: const Icon(Icons.play_arrow_sharp),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    /// 注意回收这个
    _controller.dispose();
    super.dispose();
  }
}

/// 提取这个控件继承于 AnimatedWidget
class HYAnimatedIcon extends AnimatedWidget {
  const HYAnimatedIcon({
    Key? key,
    required Animation anim,
  }) : super(listenable: anim, key: key);

  @override
  Widget build(BuildContext context) {
    Animation anim = listenable as Animation<double>;
    return Center(
      child: Icon(
        Icons.favorite,
        color: Colors.blue,
        size: anim.value,
      ),
    );
  }
}

/// 最初始的一种 直接更新 state
class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key? key}) : super(key: key);

  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

/// 必须继承于 SingleTickerProviderStateMixin
class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  // 创建AnimationController
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _sizeAnim;

  void play() {
    /// 动画的值如果是从 0 - 1
    /// 动画最开始处于 dismissed 此时值是0 此时应该是向前执行动画 forward
    /// 动画处于 completed 此时值是1 此时应该是反转执行动画 reverse
    /// 动画处于 向前 与 反转 两个状态就会处于无线循环状态
    if (_controller.isAnimating) {
      // 如果在动画中则停止
      _controller.stop();
    } else if (_controller.status == AnimationStatus.forward) {
      // 如果在停止状态且状态是向前，则继续向前
      _controller.forward();
    } else if (_controller.status == AnimationStatus.reverse) {
      // 如果在停止状态且状态是反转，则继续反转
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.completed) {
      // 如果在停止状态且状态是完成状态，则反转
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.dismissed) {
      // 如果在停止状态且状态是初始状态，则向前
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // 2.设置Curve的值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 3.Tween
    _sizeAnim = Tween(begin: 50.0, end: 150.0).animate(_animation);

    // 监听动画值的改变
    _controller.addListener(() {
      setState(() {});
    });

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Icon(
            Icons.favorite,
            color: Colors.red,
            size: _sizeAnim.value,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: FloatingActionButton(
            onPressed: () => play(),
            tooltip: 'Increment',
            backgroundColor: Colors.red,
            child: const Icon(Icons.play_arrow_sharp),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    /// 注意回收这个
    _controller.dispose();
    super.dispose();
  }
}
