// ignore_for_file: prefer_const_constructors_in_immutables

part of 'sports_bloc.dart';

abstract class SportsState extends Equatable {
  const SportsState();

  @override
  List<Object> get props => [];
}

class SportsInitial extends SportsState {}

class SportsLoading extends SportsState {}

class SportsFailure extends SportsState {
  final String errorMsg;

  SportsFailure(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

class SportsSuccess extends SportsState {
  final List<ArticleModel> sportsData;

  SportsSuccess(this.sportsData);

  @override
  List<Object> get props => [sportsData];
}
