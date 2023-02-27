// ignore_for_file: prefer_const_constructors_in_immutables

part of 'entertainment_bloc.dart';

abstract class EntertainmentState extends Equatable {
  const EntertainmentState();

  @override
  List<Object> get props => [];
}

class EntertainmentInitial extends EntertainmentState {}

class EntertainmentLoading extends EntertainmentState {}

class EntertainmentSuccess extends EntertainmentState {
  final List<ArticleModel> entertainData;

  EntertainmentSuccess(this.entertainData);

  @override
  List<Object> get props => [entertainData];
}

class EntertainmentFailure extends EntertainmentState {
  final String errorMsg;

  EntertainmentFailure(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
