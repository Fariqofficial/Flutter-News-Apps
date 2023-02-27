// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/shared/shared_value.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final String baseUrl = 'https://newsapi.org/v2';

  Future<List<ArticleModel>> getTopHeadline() async {
    try {
      final res = await http.get(
        Uri.parse(
          '$baseUrl/top-headlines?country=$country&apiKey=$apiKey',
        ),
      );

      print(res.body);

      if (res.statusCode == 200) {
        return List<ArticleModel>.from(jsonDecode(res.body)['articles'].map(
          (article) => ArticleModel.fromJson(article),
        )).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ArticleModel>> getBusinessCategory() async {
    try {
      final res = await http.get(
        Uri.parse(
          '$baseUrl/top-headlines?country=$country&category=$businessCategory&apiKey=$apiKey',
        ),
      );

      print(res.body);

      if (res.statusCode == 200) {
        return List<ArticleModel>.from(jsonDecode(res.body)['articles'].map(
          (articles) => ArticleModel.fromJson(articles),
        )).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ArticleModel>> getSportsCategory() async {
    try {
      final res = await http.get(
        Uri.parse(
          '$baseUrl/top-headlines?country=$country&category=$sportsCategory&apiKey=$apiKey',
        ),
      );

      print(res.body);

      if (res.statusCode == 200) {
        return List<ArticleModel>.from(jsonDecode(res.body)['articles'].map(
          (article) => ArticleModel.fromJson(article),
        )).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ArticleModel>> getHealthCategory() async {
    try {
      final res = await http.get(
        Uri.parse(
          '$baseUrl/top-headlines?country=$country&category=$healthCategory&apiKey=$apiKey',
        ),
      );

      print(res.body);

      if (res.statusCode == 200) {
        return List<ArticleModel>.from(jsonDecode(res.body)['articles'].map(
          (article) => ArticleModel.fromJson(article),
        )).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ArticleModel>> getEntertainCategory() async {
    try {
      final res = await http.get(
        Uri.parse(
          '$baseUrl/top-headlines?country=$country&category=$entertainmentCategory&apiKey=$apiKey',
        ),
      );

      print(res.body);

      if (res.statusCode == 200) {
        return List<ArticleModel>.from(jsonDecode(res.body)['articles'].map(
          (article) => ArticleModel.fromJson(article),
        )).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ArticleModel>> getTechCategory() async {
    try {
      final res = await http.get(
        Uri.parse(
          '$baseUrl/top-headlines?country=$country&category=$technologyCategory&apiKey=$apiKey',
        ),
      );

      print(res.body);

      if (res.statusCode == 200) {
        return List<ArticleModel>.from(jsonDecode(res.body)['articles'].map(
          (article) => ArticleModel.fromJson(article),
        )).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
