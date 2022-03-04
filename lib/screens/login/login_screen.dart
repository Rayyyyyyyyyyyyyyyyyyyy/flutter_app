import 'package:flutter/material.dart';
import 'package:test_flutter/screens/login/components/body.dart';


class LoginScreen extends StatelessWidget {
  static String routeName = "/login";

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Body(),
    );
  }
}