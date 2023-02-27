// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/service/news_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is GetNewsArticle) {
        try {
          emit(NewsLoading());

          final articles = await NewsService().getTopHeadline();

          emit(NewsSuccess(articles));

          print(articles);
        } catch (e) {
          emit(NewsFailure(e.toString()));
        }
      }
    });
  }
}
