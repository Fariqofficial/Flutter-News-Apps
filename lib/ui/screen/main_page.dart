// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/page_cubit.dart';
import 'package:flutter_news_app/shared/themes.dart';
import 'package:flutter_news_app/ui/screen/business/business_page.dart';
import 'package:flutter_news_app/ui/screen/entertainment/entertainment_page.dart';
import 'package:flutter_news_app/ui/screen/health/health_page.dart';
import 'package:flutter_news_app/ui/screen/homepage/home_page.dart';
import 'package:flutter_news_app/ui/screen/sports/sports_page.dart';
import 'package:flutter_news_app/ui/screen/technology/technology_page.dart';
import 'package:flutter_news_app/ui/widgets/custom_bottom_nav.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return BusinessPage();
        case 2:
          return SportsPage();
        case 3:
          return HealthPage();
        case 4:
          return EntertainmentPage();
        case 5:
          return TechnologyPage();
        default:
          return HomePage();
      }
    }

    Widget bottomNavigationBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNav(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomBottomNav(
                index: 1,
                imageUrl: 'assets/icon_business.png',
              ),
              CustomBottomNav(
                index: 2,
                imageUrl: 'assets/icon_sports.png',
              ),
              CustomBottomNav(
                index: 3,
                imageUrl: 'assets/icon_health.png',
              ),
              CustomBottomNav(
                index: 4,
                imageUrl: 'assets/icon_entertainment.png',
              ),
              CustomBottomNav(
                index: 5,
                imageUrl: 'assets/icon_technology.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: lightBgColor,
          body: Stack(
            children: [
              buildContent(state),
              bottomNavigationBar(),
            ],
          ),
        );
      },
    );
  }
}
