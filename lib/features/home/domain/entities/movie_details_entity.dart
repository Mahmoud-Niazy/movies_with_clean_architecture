import 'package:equatable/equatable.dart';
import 'genres_entity.dart';

class MovieDetailsEntity extends Equatable{
  final String image;
  final int id ;
  final String overview;
  final String releaseDate;
  final String title;
  final num voteAverage;
  final int runtime;
  final List<GenresEntity> genres ;

  const MovieDetailsEntity({
    required this.id,
    required this.image,
    required this.releaseDate,
    required this.overview,
    required this.title,
    required this.genres,
    required this.runtime,
    required this.voteAverage,
});

  @override
  List<Object?> get props => [
    id,
    image,
    releaseDate,
    overview,
    title,
    genres,
    runtime,
    voteAverage,
  ];
}