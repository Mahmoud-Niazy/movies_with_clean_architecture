import 'package:movie/features/home/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {required super.image,
      required super.title,
      required super.id,
      required super.voteAverage,
      required super.overview,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        image: json['backdrop_path'],
        title: json['title'],
        id: json['id'],
        voteAverage: json['vote_average'],
        overview: json['overview'],
        releaseDate: json['release_date'],
      );
}
