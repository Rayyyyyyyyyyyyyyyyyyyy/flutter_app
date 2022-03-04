import 'package:flutter/material.dart';
import 'package:test_flutter/constants.dart';
import 'package:test_flutter/size_config.dart';

import '../../../constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,required this.text,required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        VerticalSpacing(of: 25),
        Text(
          "旅遊筆記",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        VerticalSpacing(of: 16),
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: kTextColor,
              height: 1.5,
              fontSize: getProportionateScreenWidth(16),
            ),
          ),
        ),
        VerticalSpacing(of: 40),
        Image.asset(
          image,
          height: getProportionateScreenHeight(400),
          width: double.infinity,
        ),
      ],
    );
  }
}