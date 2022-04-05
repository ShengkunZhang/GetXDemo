import 'package:flutter/material.dart';

import 'image_detail.dart';
import 'modal_page.dart';

class TransitionAnimationPage extends StatelessWidget {
  const TransitionAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("转场动画"),
      ),
      body: Center(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 16 / 9),
          children: List.generate(20, (index) {
            final imageURL = "https://picsum.photos/500/500?random=$index";
            return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(PageRouteBuilder(pageBuilder: (ctx, anim1, anim2) {
                    return FadeTransition(
                        opacity: anim1, child: HYImageDetailPage(imageURL));
                  }));
                },
                child: Hero(
                  tag: imageURL,
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                  ),
                ));
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.pool),
        onPressed: () {
          // iOS -> Modal方式
//          Navigator.of(context).push(MaterialPageRoute(
//            builder: (ctx) {
//              return HYModalPage();
//            },
//            fullscreenDialog: true
//          ));
          Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: const Duration(seconds: 3),
              pageBuilder: (ctx, animation1, animation2) {
                return FadeTransition(
                  opacity: animation1,
                  child: const HYModalPage(),
                );
              }));
//          Navigator.of(context).pushNamed(routeName)
        },
      ),
    );
  }
}
