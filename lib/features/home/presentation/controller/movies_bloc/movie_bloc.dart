import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/request_state.dart';
import 'package:movie/features/home/domain/use_cases/fetch_now_playing_movies_use_cases.dart';
import 'package:movie/features/home/presentation/controller/movies_bloc/movie_event.dart';
import 'package:movie/features/home/presentation/controller/movies_bloc/movie_state.dart';

import '../../../domain/use_cases/fetch_popular_movies_use_case.dart';
import '../../../domain/use_cases/fetch_top_rated_movies_use_case.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  FetchNowPlayingMoviesUseCase fetchNowPlayingMoviesUseCase;
  FetchPopularMoviesUseCase fetchPopularMoviesUseCase;
  FetchTopRatedMoviesUseCase fetchTopRatedMoviesUseCase;


  MovieBloc(
    this.fetchNowPlayingMoviesUseCase,
    this.fetchPopularMoviesUseCase,
      this.fetchTopRatedMoviesUseCase,
  ) : super(const MovieState()) {
    on<FetchNowPlayingMoviesEvent>((event, emit) async {
      await fetchNowPlayingMovies(emit);
    }
    );

    on<FetchPopularMoviesEvent>((event, emit) async {
      await fetchPopularMovies(emit);
    });

    on<FetchTopRatedMoviesEvent>((event, emit) async {
      await fetchTopRatedMovies(emit);
    });
  }

  Future<void> fetchTopRatedMovies(Emitter<MovieState> emit) async {
    var response = await fetchTopRatedMoviesUseCase();
    response.fold(
          (failure) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: failure.errorMessage,
        ),
      ),
          (movies) => emit(
        state.copyWith(
            topRatedState: RequestState.loaded,
            topRatedMovies: movies,
            topRatedMessage: 'Success'),
      ),
    );
  }

  Future<void> fetchPopularMovies(Emitter<MovieState> emit) async {
    var response = await fetchPopularMoviesUseCase();
    response.fold(
      (failure) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
            popularState: RequestState.loaded,
            popularMovies: movies,
            popularMessage: 'Success'),
      ),
    );
  }

  Future<void> fetchNowPlayingMovies(Emitter<MovieState> emit) async {
    var response = await fetchNowPlayingMoviesUseCase();
    response.fold(
      (failure) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: movies,
            nowPlayingMessage: 'Success'),
      ),
    );
  }
}
