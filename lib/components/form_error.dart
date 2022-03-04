import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../size_config.dart';


class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Padding formErrorText({required String error}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
      child: Row(
        children: [
          Icon(
            MdiIcons.fromString("alert-circle-outline"),
            size: 18.0,
            color: Colors.red,
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Text(error),
        ],
      ),
    );
  }
}