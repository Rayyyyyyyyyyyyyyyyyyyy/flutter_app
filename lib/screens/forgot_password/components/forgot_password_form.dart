import 'package:flutter/material.dart';
import 'package:test_flutter/components/default_button.dart';
import 'package:test_flutter/components/form_error.dart';
import 'package:test_flutter/constants.dart';
import 'package:test_flutter/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              }
              if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                  if (errors.contains(kInvalidEmailError)) {
                    errors.remove(kInvalidEmailError);
                  }
                });
                return "";
              } else if (value.isNotEmpty &&
                  !emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
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
          ),
          VerticalSpacing(of: 40),
          FormError(errors: errors),
          VerticalSpacing(of: 25),
          DefaultButton(
            text: "Submit",
            onpressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // 傳送密碼至mail 驗證等等
              }
            },
          )
        ],
      ),
    );
  }
}