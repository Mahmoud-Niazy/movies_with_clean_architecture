import 'package:movie/features/home/domain/entities/movie_recommendations_entity.dart';

class MovieRecommendationsModel extends MovieRecommendationsEntity {
  const MovieRecommendationsModel({required super.image, required super.id});

  factory MovieRecommendationsModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationsModel(
        image: json['backdrop_path'],
        id: json['id'],
      );
}
