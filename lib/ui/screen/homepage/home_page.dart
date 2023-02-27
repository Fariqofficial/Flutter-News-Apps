// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/blocs/entertainment/entertainment_bloc.dart';
import 'package:flutter_news_app/blocs/health/health_bloc.dart';
import 'package:flutter_news_app/blocs/news/news_bloc.dart';
import 'package:flutter_news_app/blocs/sports/sports_bloc.dart';
import 'package:flutter_news_app/blocs/technology/technology_bloc.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/shared/themes.dart';
import 'package:flutter_news_app/ui/widgets/custom_category.dart';
import 'package:flutter_news_app/ui/widgets/custom_news.dart';
import 'package:flutter_news_app/blocs/business/business_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: whiteColor,
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
          newsSection(),
        ],
      ),
    );
  }

  Widget newsSection() {
    return BlocProvider(
      create: (context) => NewsBloc()..add(GetNewsArticle()),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          print(state);
          //Cek jika State Success
          if (state is NewsSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 23),
              child: Column(
                children: state.articles.map((article) {
                  return CustomNews(
                    articleModel: article,
                  );
                }).toList(),
              ),
            );
          } else {
            return Center(
              child: Container(
                margin: EdgeInsets.only(top: 170),
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
