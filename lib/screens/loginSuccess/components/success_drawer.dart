import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/district/district_screen.dart';

import '../../../constants.dart';



class Success_drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("${user?.displayName}") ,
            accountEmail: Text("${user?.email}"),
            currentAccountPicture: Image.asset('assets/images/profile.jpeg'),
            decoration: BoxDecoration(color: kPrimaryColor),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('美食'),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.headset),
            title: Text('美景'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushNamed(context, DistrictScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('喜好清單'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}