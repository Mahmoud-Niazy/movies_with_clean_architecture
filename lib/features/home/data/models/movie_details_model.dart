import 'package:movie/features/home/data/models/genres_model.dart';
import 'package:movie/features/home/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.id,
    required super.image,
    required super.releaseDate,
    required super.overview,
    required super.title,
    required super.genres,
    required super.runtime,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        image: json['backdrop_path'],
        releaseDate: json['release_date'],
        overview: json['overview'],
        title: json['title'],
        genres: json['genres'].map((gen)=>GenresModel.fromJson(gen)).toList(),
        runtime: json['runtime'],
        voteAverage: json['vote_average'],
      );
}
