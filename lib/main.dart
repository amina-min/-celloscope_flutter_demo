import 'package:flutter/material.dart';
import 'package:flutterapp/pages/dashboard.dart';
import 'package:flutterapp/pages/home_page.dart';
import 'package:flutterapp/pages/loading_page.dart';


void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),

    },
  ));
}
