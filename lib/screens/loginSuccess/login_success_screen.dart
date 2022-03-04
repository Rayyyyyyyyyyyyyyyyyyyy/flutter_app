import 'package:flutter/material.dart';

import 'package:test_flutter/screens/loginSuccess/components/body.dart';
import '../../constants.dart';
import 'components/success_drawer.dart';


class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/loginsuccess";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Login Success'),
      ),
      drawer: Success_drawer(),
      body: Body(),
    );
  }
}