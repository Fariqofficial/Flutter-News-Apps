// ignore_for_file: prefer_const_constructors_in_immutables

part of 'technology_bloc.dart';

abstract class TechnologyState extends Equatable {
  const TechnologyState();

  @override
  List<Object> get props => [];
}

class TechnologyInitial extends TechnologyState {}

class TechnologyLoading extends TechnologyState {}

class TechnologySuccess extends TechnologyState {
  final List<ArticleModel> techData;

  TechnologySuccess(this.techData);

  @override
  List<Object> get props => [techData];
}

class TechnologyFailure extends TechnologyState {
  final String errorMsg;

  TechnologyFailure(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
