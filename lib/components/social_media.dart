import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}