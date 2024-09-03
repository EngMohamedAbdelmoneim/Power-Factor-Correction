
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  SvgPicture.asset(
        "lib/assets/Frame 1.svg",
        fit: BoxFit.fill,
      ),

      );
  }
}
