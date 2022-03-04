import 'package:flutter/material.dart';
import 'package:test_flutter/components/default_button.dart';
import 'package:test_flutter/components/form_error.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:test_flutter/screens/forgot_password/forgot_password_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../loginSuccess/login_success_screen.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  final List<String> errors = []; // 要傳給 FormError 的錯誤清單，來顯示錯誤訊息

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          VerticalSpacing(of: 30),
          buildPasswordFormField(),
          VerticalSpacing(of: 30),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(), //佔滿剩餘空間
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                } //導入ForgotPasswordScreen
                ,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            onpressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        //若更新後的密碼，已解決錯誤，即清掉該錯誤訊息，送出時還會檢查最後密碼是否符合我們的條件
        if (value.isNotEmpty) {
          removeError(error: kPasswordNullError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPasswordError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPasswordNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPasswordError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          MdiIcons.fromString("lock-outline"),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        //若更新後的email，已解決錯誤，即清掉該錯誤訊息，送出時還會檢查最後email是否符合我們的條件
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          removeError(error: kInvalidEmailError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) { // 是否符合 email 格式
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            MdiIcons.fromString("email-outline"),
          )),
    );
  }
}