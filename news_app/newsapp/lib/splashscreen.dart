import 'dart:math';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';
import 'package:newsapp/textstyle.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  var title1 = textTheme(
      text: 'Egyption', textcolor: Colors.black, wight: true, textsize: 21);
  var title2 = textTheme(
      text: 'News', textcolor: Colors.blue, wight: true, textsize: 21);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
        body: Stack(
          children: [
            AnimatedSplashScreen(
              duration: 5000,
              splash: Image.asset('assets/images/77.gif'),
              splashIconSize: max(700, 800),
              nextScreen: MyApp(),
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: Colors.white70,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 150,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [title1, title2],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
