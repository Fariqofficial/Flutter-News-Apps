part of 'technology_bloc.dart';

abstract class TechnologyEvent extends Equatable {
  const TechnologyEvent();

  @override
  List<Object> get props => [];
}

class GetTechArticle extends TechnologyEvent {}
