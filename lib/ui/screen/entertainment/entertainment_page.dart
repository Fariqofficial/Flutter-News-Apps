// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/blocs/entertainment/entertainment_bloc.dart';
import 'package:flutter_news_app/shared/themes.dart';
import 'package:flutter_news_app/ui/widgets/custom_news.dart';

class EntertainmentPage extends StatelessWidget {
  const EntertainmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          entertainSection(),
        ],
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
