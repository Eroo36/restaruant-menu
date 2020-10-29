import 'package:flutter/material.dart';
import 'package:restaurant_menu/screens/home_screen.dart';
import 'package:restaurant_menu/screens/process_complete_screen.dart';
import 'package:restaurant_menu/screens/submenu2_screen.dart';
import 'package:restaurant_menu/screens/submenu3_screen.dart';
import 'package:restaurant_menu/screens/submenu1_screen.dart';
import 'package:restaurant_menu/screens/menuler.dart';
import 'package:restaurant_menu/screens/submenu4_screen.dart';
import 'package:restaurant_menu/screens/submenu5_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        MenulerScreen.routeName: (context) => MenulerScreen(),
        SubMenuScreen1.routeName: (context) => SubMenuScreen1(),
        SubMenuScreen2.routeName: (context) => SubMenuScreen2(),
        SubMenuScreen3.routeName: (context) => SubMenuScreen3(),
        SubMenuScreen4.routeName: (context) => SubMenuScreen4(),
        SubMenuScreen5.routeName: (context) => SubMenuScreen5(),
        ProcessCompleteScreen.routeName: (context) => ProcessCompleteScreen(),
      },
      home: MyHomePage(),
    );
  }
}
