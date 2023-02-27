part of 'entertainment_bloc.dart';

abstract class EntertainmentEvent extends Equatable {
  const EntertainmentEvent();

  @override
  List<Object> get props => [];
}

class GetEntertainArticle extends EntertainmentEvent {}
