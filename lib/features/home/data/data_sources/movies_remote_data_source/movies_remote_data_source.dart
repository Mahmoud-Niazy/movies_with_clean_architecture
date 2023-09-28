import 'package:movie/core/api_services/api_constance.dart';
import 'package:movie/core/api_services/api_services.dart';
import 'package:movie/features/home/data/models/movie_details_model.dart';
import 'package:movie/features/home/data/models/movie_model.dart';
import 'package:movie/features/home/domain/entities/movie_recommendations_entity.dart';
import '../../../domain/entities/movie_details_entity.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../models/movie_recommendation_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieEntity>> fetchNowPlayingMovies();

  Future<List<MovieEntity>> fetchTopRatedMovies();

  Future<List<MovieEntity>> fetchPopularMovies();
  
  Future<MovieDetailsEntity> fetchMovieDetails(int id);

  Future<List<MovieRecommendationsEntity>> fetchMovieRecommendations(int id);
  
}

class MoviesRemoteDataSourceImp implements MoviesRemoteDataSource {
  ApiServices apiServices;

  MoviesRemoteDataSourceImp(this.apiServices);

  @override
  Future<List<MovieEntity>> fetchNowPlayingMovies() async{
    var data = await apiServices.get(
      path: ApiConstance.getNowPlayingMoviesPath,
    );
    List<MovieEntity> movies = [];
    collectMovies(data, movies);
    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchPopularMovies() async{
    var data = await apiServices.get(
      path: ApiConstance.getPopularMoviesPath,
    );
    List<MovieEntity> movies = [];
    collectMovies(data, movies);
    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchTopRatedMovies() async{
    var data = await apiServices.get(
      path: ApiConstance.getTopRatedMoviesPath,
    );
    List<MovieEntity> movies = [];
    collectMovies(data, movies);
    return movies;
  }

  @override
  Future<MovieDetailsEntity> fetchMovieDetails(int id) async{
    var data = await apiServices.get(path: ApiConstance.fetchMovieDetailsPath(id));
    MovieDetailsEntity movieDetailsEntity = MovieDetailsModel.fromJson(data);
    return movieDetailsEntity;
  }

  @override
  Future<List<MovieRecommendationsEntity>> fetchMovieRecommendations(int id) async{
    var data = await apiServices.get(path: ApiConstance.fetchMovieRecommendations(id));
    List<MovieRecommendationsEntity> movieRecommendations =[];
    collectMovieRecommendations(data, movieRecommendations);
    return movieRecommendations;
  }

  void collectMovieRecommendations(Map<String, dynamic> data, List<MovieRecommendationsEntity> movieRecommendations) {
    for(var recommendation in data['results']){
      movieRecommendations.add(MovieRecommendationsModel.fromJson(recommendation));
    }
  }
}

void collectMovies(Map<String, dynamic> data, List<MovieEntity> movies) {
  for(var movie in data['results']){
    movies.add(MovieModel.fromJson(movie));
  }
}
