import 'package:flutter/material.dart';
import 'package:test_flutter/screens/login/login_screen.dart';
import 'package:test_flutter/screens/splash/splash_screen.dart';
import 'package:test_flutter/screens/forgot_password/forgot_password_screen.dart';
import 'package:test_flutter/screens/sign_up/sign_up_screen.dart';
import 'package:test_flutter/screens/loginSuccess/login_success_screen.dart';
import 'package:test_flutter/screens/district/district_screen.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ForgotPasswordScreen.routeName : (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  DistrictScreen.routeName: (context) => DistrictScreen(),
};




// https://ithelp.ithome.com.tw/articles/10278347