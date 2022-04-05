import 'package:flutter/material.dart';

class HYImageDetailPage extends StatelessWidget {
  final String _imageURL;

  const HYImageDetailPage(this._imageURL, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(tag: _imageURL, child: Image.network(_imageURL))),
      ),
    );
  }
}
