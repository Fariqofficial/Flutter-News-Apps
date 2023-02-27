// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_news_app/shared/themes.dart';

class CustomCategory extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CustomCategory({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: blueColor,
      ),
      child: Text(
        title,
        style: whiteText.copyWith(
          fontSize: 15,
        ),
      ),
    );
  }
}
