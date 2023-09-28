import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/request_state.dart';
import 'package:movie/features/home/domain/entities/movie_details_entity.dart';

import '../../../domain/entities/movie_recommendations_entity.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;
  final List<MovieRecommendationsEntity> movieRecommendations;
  final RequestState movieRecommendationsRequestState;
  final String movieRecommendationsMessage;

  const MovieDetailsState({
    this.movieDetails ,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage ='',
    this.movieRecommendations = const [] ,
    this.movieRecommendationsRequestState = RequestState.loading,
    this.movieRecommendationsMessage ='',
  });

  copyWith({
    MovieDetailsEntity? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
    List<MovieRecommendationsEntity>? movieRecommendations ,
    RequestState? movieRecommendationsRequestState,
    String? movieRecommendationsMessage,
}) => MovieDetailsState(
    movieDetails: movieDetails?? this.movieDetails,
    movieDetailsRequestState: movieDetailsRequestState?? this.movieDetailsRequestState,
    movieDetailsMessage: movieDetailsMessage?? this.movieDetailsMessage,
    movieRecommendations: movieRecommendations?? this.movieRecommendations,
    movieRecommendationsRequestState: movieRecommendationsRequestState?? this.movieRecommendationsRequestState,
    movieRecommendationsMessage: movieRecommendationsMessage?? this.movieRecommendationsMessage,

  );

  @override
  List<Object?> get props => [
    movieDetails,
    movieDetailsRequestState,
    movieDetailsMessage,
    movieRecommendations,
    movieRecommendationsRequestState,
    movieRecommendationsMessage,
  ];
}
