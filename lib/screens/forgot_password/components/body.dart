import 'package:flutter/material.dart';
import 'package:test_flutter/components/no_account_text.dart';
import 'package:test_flutter/constants.dart';
import 'package:test_flutter/screens/forgot_password/components/forgot_password_form.dart';
import 'package:test_flutter/size_config.dart';

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
              "Forgot Password",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            VerticalSpacing(of: 16),
            Text(
              "Please enter your email and we will send you a link to return to your account",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: kTextColor,
                height: 1.5,
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
            VerticalSpacing(of: 25),
            ForgotPasswordForm(),
            VerticalSpacing(of: 25),
            NoAccountText(),
            VerticalSpacing(of: 25),
          ],
        ),
      ),
    );
  }
}