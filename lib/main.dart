import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home_page.dart';
import 'package:flutterapp/pages/loading_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Celloscope',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    },
  ));
}
