import 'package:flutter/material.dart';
import 'package:test_flutter/components/default_button.dart';
import 'package:test_flutter/components/form_error.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}


class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirmPassword;
  final List<String> errors = [];

  get kConfirmPasswordNullError => null;

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
          VerticalSpacing(of: 25),
          buildPasswordFormField(),
          VerticalSpacing(of: 25),
          buildConfirmPasswordFormField(),
          VerticalSpacing(of: 40),
          FormError(errors: errors),
          VerticalSpacing(of: 25),
          DefaultButton(
            text: "Sign Up",
            onpressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
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
        } else if (!emailValidatorRegExp.hasMatch(value)) {
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
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        password = value;
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
          removeError(error: kShortPasswordError);
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

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kConfirmPasswordNullError);
        }
        print("value $value, password $password");
        if (value == password) {
          removeError(error: kMatchPasswordError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kConfirmPasswordNullError);
          removeError(error: kMatchPasswordError);
          return "";
        } else if (value != password) {
          addError(error: kMatchPasswordError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          MdiIcons.fromString("lock-outline"),
        ),
      ),
    );
  }
}