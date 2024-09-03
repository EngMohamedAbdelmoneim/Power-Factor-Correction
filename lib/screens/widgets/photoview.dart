import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class View1 extends StatelessWidget {
  const View1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child :GestureDetector(
        onTap: (){Navigator.pop(context); },
        child: Hero(
          tag: "fullimage",
          child: InteractiveViewer(
            minScale: 0.1,
            maxScale: 1.6,
            child: Image.asset(
              "assets/images/Desktop Splash.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
