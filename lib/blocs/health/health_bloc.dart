import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/service/news_service.dart';

part 'health_event.dart';
part 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  HealthBloc() : super(HealthInitial()) {
    on<HealthEvent>((event, emit) async {
      if (event is GetHealthArticle) {
        try {
          emit(HealthLoading());

          final healthData = await NewsService().getHealthCategory();

          emit(HealthSuccess(healthData));
        } catch (e) {
          emit(HealthFailure(e.toString()));
        }
      }
    });
  }
}
