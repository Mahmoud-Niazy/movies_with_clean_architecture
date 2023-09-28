import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:movie/features/home/presentation/controller/movie_details_bloc/movie_details_event.dart';
import 'package:movie/features/home/presentation/controller/movie_details_bloc/movie_details_state.dart';

import '../../../../../core/utils/request_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  FetchMovieDetailsUseCase fetchMovieDetailsUseCase;

  MovieDetailsBloc(this.fetchMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<FetchMovieDetailsEvent>((event, emit) async {
      var response = await fetchMovieDetailsUseCase();
      response.fold(
        (failure) => emit(
          const MovieDetailsState(
            movieDetailsMessage: 'Error',
            requestState: RequestState.error,
          ),
        ),
        (movieDetails) => emit(
          MovieDetailsState(
            requestState: RequestState.loaded,
            movieDetails: movieDetails,
          ),
        ),
      );
    });
  }
}
