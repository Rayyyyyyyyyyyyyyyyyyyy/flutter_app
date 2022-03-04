import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
// import 'package:test_flutter/screens/sign_up/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {}, //導入SignUpScreen
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                decoration: TextDecoration.underline,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}