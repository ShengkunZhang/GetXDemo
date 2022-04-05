import 'dart:math';
import 'package:flutter/material.dart';

class InterleavedAnimationPage extends StatefulWidget {
  const InterleavedAnimationPage({Key? key}) : super(key: key);

  @override
  _InterleavedAnimationPageState createState() =>
      _InterleavedAnimationPageState();
}

class _InterleavedAnimationPageState extends State<InterleavedAnimationPage>
    with SingleTickerProviderStateMixin {
  // 创建AnimationController
  late AnimationController _controller;
  late Animation _animation;

  late Animation _sizeAnim;
  late Animation _colorAnim;
  late Animation _opacityAnim;
  late Animation _radiansAnim;

  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // 2.设置Curve的值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 3.Tween
    // 3.1.创建size的tween
    _sizeAnim = Tween(begin: 10.0, end: 200.0).animate(_controller);
    // 3.2.创建color的tween
    _colorAnim = ColorTween(begin: Colors.orange, end: Colors.purple)
        .animate(_controller);
    // 3.3.创建opacity的tween
    _opacityAnim = Tween(begin: 0.3, end: 1.0).animate(_controller);
    // 3.4.创建radians的tween
    _radiansAnim = Tween(begin: 0.0, end: 2 * pi).animate(_controller);

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

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
  Widget build(BuildContext context) {
    /**
     * 1.大小变化动画
     * 2.颜色变化动画
     * 3.透明度变化动画
     */
    return Scaffold(
      appBar: AppBar(
        title: const Text("复杂动画"),
      ),
      body: Center(
          child: AnimatedBuilder(
        animation: _controller,
        builder: (ctx, child) {
          return Opacity(
            opacity: _opacityAnim.value,
            child: Transform(
              transform: Matrix4.rotationZ(_radiansAnim.value),
              alignment: Alignment.center,
              child: Container(
                width: _sizeAnim.value,
                height: _sizeAnim.value,
                color: _colorAnim.value,
              ),
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () => play(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
