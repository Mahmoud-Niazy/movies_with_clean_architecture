import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/request_state.dart';
import 'package:movie/features/home/domain/entities/movie_details_entity.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetails;
  final RequestState requestState;
  final String movieDetailsMessage;

  const MovieDetailsState({
    this.movieDetails ,
    this.requestState = RequestState.loading,
    this.movieDetailsMessage ='',
  });

  copyWith({
    MovieDetailsEntity? movieDetails,
    RequestState? requestState,
    String? movieDetailsMessage,
}) => MovieDetailsState(
    movieDetails: movieDetails?? this.movieDetails,
    requestState: requestState?? this.requestState,
    movieDetailsMessage: movieDetailsMessage?? this.movieDetailsMessage
  );

  @override
  List<Object?> get props => [
    movieDetails,
    requestState,
    movieDetailsMessage,
  ];
}
