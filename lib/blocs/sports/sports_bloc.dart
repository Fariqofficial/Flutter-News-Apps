import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/service/news_service.dart';

part 'sports_event.dart';
part 'sports_state.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  SportsBloc() : super(SportsInitial()) {
    on<SportsEvent>((event, emit) async {
      if (event is GetSportsArticle) {
        try {
          emit(SportsLoading());

          final sportsData = await NewsService().getSportsCategory();

          emit(SportsSuccess(sportsData));
        } catch (e) {
          emit(SportsFailure(e.toString()));
        }
      }
    });
  }
}
