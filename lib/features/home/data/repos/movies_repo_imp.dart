import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/features/home/data/data_sources/movies_remote_data_source/movies_remote_data_source.dart';
import 'package:movie/features/home/domain/entities/movie_entity.dart';
import 'package:movie/features/home/domain/entities/movie_recommendations_entity.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/repos/movie_repo.dart';

class MoviesRepoImp extends MoviesRepo {
  MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepoImp(this.moviesRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchNowPlayingMovies() async{
    try{
      var movies = await moviesRemoteDataSource.fetchNowPlayingMovies();
      return right(movies);
    }
    catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDioException(error));
      }
      else{
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies()async {
    try{
      var movies = await moviesRemoteDataSource.fetchPopularMovies();
      return right(movies);
    }
    catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDioException(error));
      }
      else{
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies()async {
    try{
      var movies = await moviesRemoteDataSource.fetchTopRatedMovies();
      return right(movies);
    }
    catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDioException(error));
      }
      else{
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> fetchMovieDetails(int id)async {
    try{
      var moviesDetails = await moviesRemoteDataSource.fetchMovieDetails(id);
      return right(moviesDetails);
    }
    catch(error){
      // print(error.toString());
      if(error is DioException){
        return left(ServerFailure.fromDioException(error));
      }
      else{
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendationsEntity>>> fetchMovieRecommendations(int id)async {
    try{
      var movieRecommendations = await moviesRemoteDataSource.fetchMovieRecommendations(id);
      return right(movieRecommendations);
    }
    catch(error){
      // print(error.toString());
      if(error is DioException){
        return left(ServerFailure.fromDioException(error));
      }
      else{
        return left(ServerFailure(error.toString()));
      }
    }
  }
}
