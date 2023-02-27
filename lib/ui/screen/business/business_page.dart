// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_news_app/shared/themes.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: lightBgColor,
        automaticallyImplyLeading: false,
        title: Container(
          child: Image.asset(
            'assets/img_logo.png',
            height: 30,
            width: 30,
          ),
        ),
      ),
      body: ListView(
        children: [
          BusinessPage(),
        ],
      ),
    );
  }

  Widget articleBusiness() {
    return Container(
      margin: EdgeInsets.only(top: 23),
      child: Column(
        children: [],
      ),
    );
  }
}
