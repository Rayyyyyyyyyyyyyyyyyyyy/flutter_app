import 'package:flutter/material.dart';
// import 'package:test_flutter/screens/food/food_page_screen.dart';
// import 'package:test_flutter/screens/food_East/food_East_screen.dart';
// import 'package:test_flutter/screens/food_Middle/food_Middle_screen.dart';
// import 'package:test_flutter/screens/food_South/food_South_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // padding: EdgeInsets.all(8),

      child: Column(
        children: <Widget>[
          Text("請選擇想查找的區域",
            style: TextStyle(
              color: kTextColor,
              fontSize: getProportionateScreenWidth(40),
              fontWeight: FontWeight.bold,
              height: 6,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 80, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: RaisedButton(
                    child: Text('北部'),
                    padding: new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
                    onHighlightChanged:(bool b) {
                      print(b);
                    },
                    onPressed: (){
                      // Navigator.pushNamed(context, Foodpage.routeName);
                    },
                    textColor: Colors.white,
                    color: kPrimaryColor,

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 80, bottom: 60, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        child: Text('中部'),
                        padding: new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
                        onHighlightChanged:(bool b) {
                          print(b);
                        },
                        onPressed: (){
                          // Navigator.pushNamed(context, Foodpagemiddle.routeName);
                        },
                        textColor: Colors.white,
                        color: kPrimaryColor,

                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 60),
                        child: RaisedButton(
                          child: Text('東部'),
                          padding: new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
                          onHighlightChanged:(bool b) {
                            print(b);
                          },
                          onPressed: (){
                            // Navigator.pushNamed(context, Foodpageeast.routeName);
                          },
                          textColor: Colors.white,
                          color: kPrimaryColor,

                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  child: RaisedButton(
                    child: Text('南部'),
                    padding: new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
                    onHighlightChanged:(bool b) {
                      print(b);
                    },
                    onPressed: (){
                      // Navigator.pushNamed(context, Foodpagesouth.routeName);
                    },
                    textColor: Colors.white,
                    color: kPrimaryColor,

                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );

  }
}