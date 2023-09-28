import 'package:dartz/dartz.dart';

import 'package:movie/core/errors/failure.dart';
import 'package:movie/features/home/domain/repos/movie_repo.dart';

import '../../../../core/use_case/use_case.dart';
import '../entities/movie_recommendations_entity.dart';

class FetchMovieRecommendationsUseCase extends UseCase<List<MovieRecommendationsEntity>,int>{
  MoviesRepo moviesRepo;
  FetchMovieRecommendationsUseCase(this.moviesRepo);
  @override
  Future<Either<Failure, List<MovieRecommendationsEntity>>> call([int? param])async {
    return await moviesRepo.fetchMovieRecommendations(param!);
  }

}