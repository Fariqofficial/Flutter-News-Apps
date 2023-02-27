// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/shared/themes.dart';
import 'package:flutter_news_app/ui/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class DetailNews extends StatelessWidget {
  final ArticleModel data;

  const DetailNews({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    //BACKGROUND IMAGE SECTION
    Widget backgroundImage() {
      return Container(
        height: 450,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: data.urlToImage == null
                  ? AssetImage(
                      'assets/icon_logo.png',
                    )
                  : NetworkImage(data.urlToImage!) as ImageProvider),
        ),
      );
    }

    //SHADOW BACKGROUND IMAGE SECTION
    Widget customShadow() {
      return Container(
        height: 214,
        margin: EdgeInsets.only(top: 236),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              whiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    //CONTENT SECTION
    Widget contentSection() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 23),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Text(
                    data.title.toString(),
                    style: blackText.copyWith(
                      fontSize: 26,
                      fontWeight: bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 35),
                  Text(
                    data.description == null
                        ? 'null'
                        : data.description.toString(),
                    style: greyText.copyWith(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 35),
                  CustomButton(
                    text: 'Read Full Article',
                  ),
                  SizedBox(height: 50),
                  Text(
                    DateFormat('MMM dd').format(
                      data.publishedAt ?? DateTime.now(),
                    ),
                    style: greyText,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Author : ${data.author}',
                    style: blackText,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: lightBgColor,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: lightBgColor,
        title: Container(
          child: Image.asset(
            'assets/img_logo.png',
            height: 30,
            width: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            contentSection(),
          ],
        ),
      ),
    );
  }
}
