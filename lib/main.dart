// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/page_cubit.dart';
import 'package:flutter_news_app/ui/screen/detail_news/detail_news.dart';
import 'package:flutter_news_app/ui/screen/homepage/home_page.dart';
import 'package:flutter_news_app/ui/screen/splashscreen/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => HomePage(),
          '/detail': (context) => DetailNews(),
        },
      ),
    );
  }
}
