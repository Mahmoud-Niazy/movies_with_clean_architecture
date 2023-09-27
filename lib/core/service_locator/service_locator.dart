import 'package:get_it/get_it.dart';
import 'package:movie/core/api_services/api_services.dart';
import 'package:movie/features/home/data/repos/movies_repo_imp.dart';
import 'package:movie/features/home/domain/repos/movie_repo.dart';
import 'package:movie/features/home/domain/use_cases/fetch_now_playing_movies_use_cases.dart';
import 'package:movie/features/home/presentation/controller/movie_bloc.dart';
import '../../features/home/data/data_sources/movies_remote_data_source/movies_remote_data_source.dart';
import '../../features/home/domain/use_cases/fetch_popular_movies_use_case.dart';
import '../../features/home/domain/use_cases/fetch_top_rated_movies_use_case.dart';

GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  init() {
    ///Bloc
    serviceLocator.registerFactory<MovieBloc>(() => MovieBloc(
          serviceLocator(),
          serviceLocator(),
          serviceLocator(),
        ));

    ///API Services
    serviceLocator.registerLazySingleton<ApiServices>(() => ApiServices());

    ///Movies Remote Data Source
    serviceLocator.registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImp(serviceLocator()));

    ///Use Cases
    serviceLocator.registerLazySingleton<FetchNowPlayingMoviesUseCase>(
        () => FetchNowPlayingMoviesUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton<FetchPopularMoviesUseCase>(
        () => FetchPopularMoviesUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton<FetchTopRatedMoviesUseCase>(
        () => FetchTopRatedMoviesUseCase(serviceLocator()));

    ///Movies Repo
    serviceLocator.registerLazySingleton<MoviesRepo>(
        () => MoviesRepoImp(serviceLocator()));
  }
}
