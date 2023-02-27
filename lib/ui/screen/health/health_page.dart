// ignore_for_file: avoid_print, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/blocs/health/health_bloc.dart';
import 'package:flutter_news_app/shared/themes.dart';
import 'package:flutter_news_app/ui/widgets/custom_news.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

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
          healthSection(),
        ],
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
}
