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
  ArticleModel? selectedArticles;

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
          // businessNewsSection(),
          // sportsSection(),
        ],
      ),
      //BOTTOM NAVIGATION BAR SECTION
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          //Untuk styling text / label yang sedang di klik
          selectedLabelStyle: blueText.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          //Untuk styling text / label yang sedang tidak klik
          unselectedLabelStyle: blackText.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_home.png',
                width: 20,
                color: blueColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_sports.png',
                width: 20,
              ),
              label: 'Sports',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_business.png',
                width: 20,
              ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_health.png',
                width: 20,
              ),
              label: 'Health',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_technology.png',
                width: 20,
              ),
              label: 'Technology',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_entertainment.png',
                width: 20,
              ),
              label: 'Entertain',
            ),
          ],
        ),
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

  Widget businessNewsSection() {
    return BlocProvider(
      create: (context) => BusinessBloc()..add(GetBusinessCategory()),
      child: BlocBuilder<BusinessBloc, BusinessState>(
        builder: (context, state) {
          print(state);
          //Jika State Success
          if (state is BusinessSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 23),
              child: Column(
                children: state.business.map((business) {
                  return CustomNews(
                    articleModel: business,
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

  Widget healthSection() {
    return BlocProvider(
      create: (context) => HealthBloc()..add(GetHealthArticle()),
      child: BlocBuilder<HealthBloc, HealthState>(
        builder: (context, state) {
          print(state);
          //Jika State Success
          if (state is HealthSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 23),
              child: Column(
                children: state.healthData.map((health) {
                  return CustomNews(
                    articleModel: health,
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

  Widget sportsSection() {
    return BlocProvider(
      create: (context) => SportsBloc()..add(GetSportsArticle()),
      child: BlocBuilder<SportsBloc, SportsState>(
        builder: (context, state) {
          print(state);
          //Jika State Success
          if (state is SportsSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 23),
              child: Column(
                children: state.sportsData.map((sport) {
                  return CustomNews(
                    articleModel: sport,
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

  Widget techSection() {
    return BlocProvider(
      create: (context) => TechnologyBloc()..add(GetTechArticle()),
      child: BlocBuilder<TechnologyBloc, TechnologyState>(
        builder: (context, state) {
          print(state);
          //Jika State Success
          if (state is TechnologySuccess) {
            return Container(
              margin: EdgeInsets.only(top: 23),
              child: Column(
                children: state.techData.map((tech) {
                  return CustomNews(
                    articleModel: tech,
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

  Widget entertainSection() {
    return BlocProvider(
      create: (context) => EntertainmentBloc()..add(GetEntertainArticle()),
      child: BlocBuilder<EntertainmentBloc, EntertainmentState>(
        builder: (context, state) {
          print(state);
          //Jika State Success
          if (state is EntertainmentSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 23),
              child: Column(
                children: state.entertainData.map((entertain) {
                  return CustomNews(
                    articleModel: entertain,
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
