// ignore_for_file: prefer_const_constructors_in_immutables

part of 'health_bloc.dart';

abstract class HealthState extends Equatable {
  const HealthState();

  @override
  List<Object> get props => [];
}

class HealthInitial extends HealthState {}

class HealthLoading extends HealthState {}

class HealthFailure extends HealthState {
  final String errorMsg;

  HealthFailure(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

class HealthSuccess extends HealthState {
  final List<ArticleModel> healthData;

  HealthSuccess(this.healthData);

  @override
  List<Object> get props => [healthData];
}
