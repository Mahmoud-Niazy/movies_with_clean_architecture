import 'package:dartz/dartz.dart';
import 'package:movie/features/home/domain/entities/movie_entity.dart';
import '../../../../core/errors/failure.dart';
import '../entities/movie_details_entity.dart';

abstract class MoviesRepo{
  Future<Either<Failure,List<MovieEntity>>>fetchNowPlayingMovies();
  Future<Either<Failure,List<MovieEntity>>>fetchTopRatedMovies();
  Future<Either<Failure,List<MovieEntity>>>fetchPopularMovies();

  Future<Either<Failure,MovieDetailsEntity>>fetchMovieDetails(int id);
}