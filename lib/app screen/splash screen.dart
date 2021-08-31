import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app%20screen/homescreen.dart';
import 'package:news_app/main.dart';

import 'login.dart';

void main() => runApp(SplashScreen());

class SplashScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SplashScreen',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(

        splash:Image.network('https://lh3.googleusercontent.com/JWqm6h_T686nzWijsbmtqTTrCD287MOkfJn02EAhovHPde5qSuoQkgSiA62eNUVngDg=s300'),
      splashIconSize: 300,
      nextScreen: Login(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,),
    );
  }
}
