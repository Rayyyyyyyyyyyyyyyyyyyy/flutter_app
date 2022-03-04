import 'package:flutter/material.dart';
import 'package:test_flutter/components/social_media.dart';
import 'package:test_flutter/screens/sign_up/components/sign_up_form.dart';
import 'package:test_flutter/size_config.dart';
class Body extends StatelessWidget {
  get contentStyle => null;

  get headingStyle => null;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
        child: Column(
          children: [
            Text(
              "Register Account",
              style: headingStyle,
            ),
            VerticalSpacing(of: 16),
            Text(
              "Sign up with your email or continue with social media",
              style: contentStyle,
            ),
            VerticalSpacing(of: 25),
            SignUpForm(),
            VerticalSpacing(of: 25),
            SocialMedia(),
            VerticalSpacing(of: 25),
          ],
        ),
      ),
    );
  }
}