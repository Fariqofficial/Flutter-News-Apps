// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/shared/themes.dart';
import 'package:flutter_news_app/ui/screen/homepage/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: lightBgColor,
      body: Center(
        child: Container(
          width: 207,
          height: 239,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/img_logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
