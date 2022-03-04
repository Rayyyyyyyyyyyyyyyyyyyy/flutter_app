import 'package:flutter/material.dart';
import 'package:test_flutter/screens/district/components/body.dart';

class DistrictScreen extends StatelessWidget {
  static String routeName = "/district";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('District'),
      ),
      body:Body(),
    );
  }
}