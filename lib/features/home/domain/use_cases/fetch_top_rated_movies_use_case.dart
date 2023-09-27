import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/features/home/domain/entities/movie_entity.dart';
import 'package:movie/features/home/domain/repos/movie_repo.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../../core/utils/no_param.dart';

class FetchTopRatedMoviesUseCase extends UseCase<List<MovieEntity>,NoParam>{
  final MoviesRepo moviesRepo;
  FetchTopRatedMoviesUseCase(this.moviesRepo);
  @override
  Future<Either<Failure, List<MovieEntity>>> call([NoParam? param]) async{
    return await moviesRepo.fetchTopRatedMovies();
  }
}