import 'package:flutter/material.dart';
import 'package:test_flutter/components/default_button.dart';
import 'package:test_flutter/screens/splash/components/splash_content.dart';
import 'package:test_flutter/size_config.dart';
import '../../../constants.dart';
import '../../login/login_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "歡迎來到這個旅遊筆記，讓我們開始計劃一個旅行吧！！！",
      "image": "assets/images/t1.jpeg"
    },
    {
      "text": "來看看如何簡單規劃一個有趣的旅行吧！！！",
      "image": "assets/images/t2.jpeg"
    },
    {
      "text": "就讓我們繼續看下去吧！！！",
      "image": "assets/images/t3.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image:splashData[index]["image"] ?? '',
                  text: splashData[index]['text']?? '',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(25),
                  getProportionateScreenWidth(25),
                  getProportionateScreenWidth(25),
                  getProportionateScreenWidth(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                          (index) => buildDot(index: index),
                    ),
                  ),
                  VerticalSpacing(of: 40),
                  DefaultButton(
                    text: getButtonText(),
                    onpressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    }, //onpressed: () {},ed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 30 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  String getButtonText() {
    if (currentPage == splashData.length - 1) {
      return "Continue";
    } else {
      return "Skip";
    }
  }
}
