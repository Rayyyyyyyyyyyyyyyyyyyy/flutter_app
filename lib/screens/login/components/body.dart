import 'package:flutter/material.dart';
import 'package:test_flutter/screens/sign_up/sign_up_screen.dart';
import 'package:test_flutter/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../constants.dart';
import 'login_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
        child: Column(
          children: [
            Text(
              "Welcome to Travel Note",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            VerticalSpacing(of: 16),
            Text(
                'Log in with your email and password \nor continue with social media',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: kTextColor,
                  height: 1.5,
                  fontSize: getProportionateScreenWidth(16),
                )),
            VerticalSpacing(of: 25),
            LoginForm(),
            VerticalSpacing(of: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(MdiIcons.fromString("google")),
                    iconSize: 24,
                    onPressed: () {}),
                IconButton(
                    icon: Icon(MdiIcons.fromString("facebook")),
                    iconSize: 24,
                    onPressed: () {}),
                IconButton(
                    icon: Icon(MdiIcons.fromString("twitter")),
                    iconSize: 24,
                    onPressed: () {}),
              ],
            ),
            VerticalSpacing(of: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
                  style:
                  TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);

                  }, //導入SignUpScreen
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        decoration: TextDecoration.underline,
                        color: kPrimaryColor),
                  ),
                ),
              ],
            ),
            VerticalSpacing(of: 25),
          ],
        ),
      ),
    );
  }
}