import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/core/use_case/use_case.dart';
import 'package:movie/core/utils/no_param.dart';
import 'package:movie/features/home/domain/repos/movie_repo.dart';
import '../entities/movie_entity.dart';

class FetchNowPlayingMoviesUseCase extends UseCase<List<MovieEntity>,NoParam>{
   final MoviesRepo moviesRepo ;
   FetchNowPlayingMoviesUseCase(this.moviesRepo);
  @override
  Future<Either<Failure, List<MovieEntity>>> call([NoParam? param]) async {
    return await moviesRepo.fetchNowPlayingMovies();
  }


}