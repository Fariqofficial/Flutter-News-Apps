// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/service/news_service.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  BusinessBloc() : super(BusinessInitial()) {
    on<BusinessEvent>((event, emit) async {
      if (event is GetBusinessCategory) {
        try {
          emit(BusinessLoading());

          final business = await NewsService().getBusinessCategory();

          emit(BusinessSuccess(business));

          print(business);
        } catch (e) {
          emit(BusinessFailure(e.toString()));
        }
      }
    });
  }
}
