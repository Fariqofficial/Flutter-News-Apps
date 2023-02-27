import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/service/news_service.dart';

part 'technology_event.dart';
part 'technology_state.dart';

class TechnologyBloc extends Bloc<TechnologyEvent, TechnologyState> {
  TechnologyBloc() : super(TechnologyInitial()) {
    on<TechnologyEvent>((event, emit) async {
      if (event is GetTechArticle) {
        try {
          emit(TechnologyLoading());

          final techData = await NewsService().getTechCategory();

          emit(TechnologySuccess(techData));
        } catch (e) {
          emit(TechnologyFailure(e.toString()));
        }
      }
    });
  }
}
