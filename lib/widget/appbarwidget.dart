import 'package:flutter/material.dart';

import '../pages/home/main_screen.dart';
import '../pages/home/serech_screen.dart';
import '../pages/listAppbar/contact_us_screen.dart';
import '../pages/listAppbar/settings_screen.dart';

class AppBarClass {
  PreferredSizeWidget? getAppBar(BuildContext context) {
    return  AppBar(

        leading: IconButton(onPressed: () {
          _showMenu(context);
        },
            icon: Icon(Icons.list)),
        title: Text(
          'WEATHER APP',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,

    );
  }


  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 2.5,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text('Search'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => SerechScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contacts),
                    title: Text('Contact Us'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => ContactUsScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}