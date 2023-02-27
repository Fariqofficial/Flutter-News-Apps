// ignore_for_file: prefer_const_constructors_in_immutables

part of 'business_bloc.dart';

abstract class BusinessState extends Equatable {
  const BusinessState();

  @override
  List<Object> get props => [];
}

class BusinessInitial extends BusinessState {}

class BusinessLoading extends BusinessState {}

class BusinessFailure extends BusinessState {
  final String errorMsg;

  BusinessFailure(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

class BusinessSuccess extends BusinessState {
  final List<ArticleModel> business;

  BusinessSuccess(this.business);

  @override
  List<Object> get props => [business];
}
