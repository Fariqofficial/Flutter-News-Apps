// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/blocs/technology/technology_bloc.dart';
import 'package:flutter_news_app/shared/themes.dart';
import 'package:flutter_news_app/ui/widgets/custom_news.dart';

class TechnologyPage extends StatelessWidget {
  const TechnologyPage({super.key});

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
          techSection(),
        ],
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
}
