import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user;
    return Scaffold(
        body: const Center(
          child:  Text('     歡迎來到旅遊日記~\n     向右滑動打開選單 ',
            style: TextStyle(fontSize: 30.0),
          ),
        )
    ) ;
  }
}