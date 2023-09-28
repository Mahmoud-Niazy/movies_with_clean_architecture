import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:movie/features/home/presentation/controller/movie_details_bloc/movie_details_event.dart';
import 'package:movie/features/home/presentation/controller/movie_details_bloc/movie_details_state.dart';
import '../../../../../core/utils/request_state.dart';
import '../../../domain/use_cases/fetch_recommendations_use_case.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  FetchMovieDetailsUseCase fetchMovieDetailsUseCase;
  FetchMovieRecommendationsUseCase fetchMovieRecommendationsUseCase;

  MovieDetailsBloc(
    this.fetchMovieDetailsUseCase,
    this.fetchMovieRecommendationsUseCase,
  ) : super(const MovieDetailsState()) {
    on<FetchMovieDetailsEvent>((event, emit) async {
      await fetchMovieDetails(emit);
    });

    on<FetchMovieRecommendations>((event, emit) async {
      await fetchMovieRecommendations(emit);
    });
  }

  Future<void> fetchMovieRecommendations(Emitter<MovieDetailsState> emit) async {
    var response = await fetchMovieRecommendationsUseCase();
    response.fold(
      (failure) => emit(
        state.copyWith(
          movieRecommendationsMessage: 'Error',
          movieRecommendationsRequestState: RequestState.error,
        )
      ),
      (recommendations) => emit(
        state.copyWith(
          movieRecommendationsRequestState: RequestState.loaded,
          movieRecommendations: recommendations,
          movieRecommendationsMessage: 'Success'
        )
      ),
    );
  }

  Future<void> fetchMovieDetails(Emitter<MovieDetailsState> emit) async {
    var response = await fetchMovieDetailsUseCase();
    response.fold(
      (failure) => emit(
        state.copyWith(
          movieDetailsMessage: 'Error',
          movieDetailsRequestState: RequestState.error,
        ),
      ),
      (movieDetails) => emit(
        state.copyWith(
            movieDetailsRequestState: RequestState.loaded,
            movieDetails: movieDetails,
            movieDetailsMessage: 'Success'),
      ),
    );
  }
}
