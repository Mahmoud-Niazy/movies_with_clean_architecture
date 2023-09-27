import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/request_state.dart';
import '../../domain/entities/movie_entity.dart';

class MovieState extends Equatable {
  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<MovieEntity> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<MovieEntity> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
});

   copyWith({
     List<MovieEntity>? nowPlayingMovies,
     RequestState? nowPlayingState,
     String? nowPlayingMessage,
     List<MovieEntity>? popularMovies,
     RequestState? popularState,
     String? popularMessage,
     List<MovieEntity>? topRatedMovies,
     RequestState? topRatedState,
     String? topRatedMessage,
}) => MovieState(
     nowPlayingMessage: nowPlayingMessage?? this.nowPlayingMessage,
     nowPlayingMovies: nowPlayingMovies?? this.nowPlayingMovies,
     nowPlayingState: nowPlayingState?? this.nowPlayingState,
     popularMessage: popularMessage?? this.popularMessage,
     popularMovies: popularMovies?? this.popularMovies,
     popularState: popularState?? this.popularState,
     topRatedMessage: topRatedMessage?? this.topRatedMessage,
     topRatedMovies: topRatedMovies?? this.topRatedMovies,
     topRatedState: topRatedState?? this.topRatedState,
   );

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
    popularMovies,
    popularState,
    popularMessage,
    topRatedMovies,
    topRatedState,
    topRatedMessage,
  ];

}
