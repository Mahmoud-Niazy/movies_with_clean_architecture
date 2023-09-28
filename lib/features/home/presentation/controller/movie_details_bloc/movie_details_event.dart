import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable{
  const MovieDetailsEvent();
  @override
  List<Object> get props => [];
}

class FetchMovieDetailsEvent extends MovieDetailsEvent{
  final int id ;
  const FetchMovieDetailsEvent(this.id);
}

class FetchMovieRecommendations extends MovieDetailsEvent{
  final int id ;
  const FetchMovieRecommendations(this.id);
}