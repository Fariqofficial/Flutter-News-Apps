// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/blocs/business/business_bloc.dart';
import 'package:flutter_news_app/shared/themes.dart';
import 'package:flutter_news_app/ui/widgets/custom_news.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

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
          businessNewsSection(),
        ],
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
}
