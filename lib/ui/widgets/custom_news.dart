// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/shared/themes.dart';
import 'package:intl/intl.dart';

class CustomNews extends StatelessWidget {
  final ArticleModel articleModel;
  final bool isSelected;

  const CustomNews({
    super.key,
    required this.articleModel,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: articleModel.urlToImage == null
                      ? AssetImage(
                          'assets/icon_logo.png',
                        )
                      : NetworkImage(articleModel.urlToImage!)
                          as ImageProvider),
            ),
          ),
          SizedBox(width: 3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  articleModel.title.toString(),
                  style: blackText.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 9),
                Text(
                  articleModel.description.toString(),
                  style: greyText.copyWith(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      articleModel.author.toString(),
                      style: greyText,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
