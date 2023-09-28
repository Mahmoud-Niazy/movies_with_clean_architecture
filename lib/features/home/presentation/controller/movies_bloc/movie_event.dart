import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable{
  const MovieEvent();
  @override
  List<Object> get props => [];
}

class FetchNowPlayingMoviesEvent extends MovieEvent{}
class FetchPopularMoviesEvent extends MovieEvent{}
class FetchTopRatedMoviesEvent extends MovieEvent{}