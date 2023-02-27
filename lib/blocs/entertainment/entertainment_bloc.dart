import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/service/news_service.dart';

part 'entertainment_event.dart';
part 'entertainment_state.dart';

class EntertainmentBloc extends Bloc<EntertainmentEvent, EntertainmentState> {
  EntertainmentBloc() : super(EntertainmentInitial()) {
    on<EntertainmentEvent>((event, emit) async {
      if (event is GetEntertainArticle) {
        try {
          emit(EntertainmentLoading());

          final entertainData = await NewsService().getEntertainCategory();

          emit(EntertainmentSuccess(entertainData));
        } catch (e) {
          emit(EntertainmentFailure(e.toString()));
        }
      }
    });
  }
}
