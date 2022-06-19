import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset(
              'assets/world-icon.png',
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 42.0,
                    letterSpacing: 5,
                    fontWeight: FontWeight.w400),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Welcome',textStyle: TextStyle(color: Colors.grey)),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber.shade800),
            )
          ],
        ),
      ),
    );
  }
}
