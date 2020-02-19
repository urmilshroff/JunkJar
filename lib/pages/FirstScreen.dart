import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:junkjar/models/user.dart';
import 'package:junkjar/utils/Colours.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  final SharedPreferences prefs;

  FirstScreen({Key key, @required this.prefs}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final User _user =
        User.fromJson(json.decode(widget.prefs.getString('user')));
    // gets logged in user back into our custom class object

    return Scaffold(
      backgroundColor: MyColors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(_user.photoUrl)
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Welcome, ${_user.name}', // use the same format
                  style: TextStyle(fontSize: 22, color: GradientColors.lightStart)
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              color: MyColors.darkBlue,
            ),
            title: new Text(
              'Home',
              style: TextStyle(color: MyColors.darkBlue),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.mail,
              color: MyColors.darkBlue,
            ),
            title: new Text(
              'Messages',
              style: TextStyle(color: MyColors.darkBlue),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: MyColors.darkBlue,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: MyColors.darkBlue),
              )),
        ],
      ),
    );
  }
}