import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/features/home/domain/repos/movie_repo.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/movie_details_entity.dart';

class FetchMovieDetailsUseCase extends UseCase<MovieDetailsEntity,int>{
  MoviesRepo moviesRepo;
  FetchMovieDetailsUseCase(this.moviesRepo);
  @override
  Future<Either<Failure, MovieDetailsEntity>> call([int? param]) async{
    return await moviesRepo.fetchMovieDetails(param!);
  }
}