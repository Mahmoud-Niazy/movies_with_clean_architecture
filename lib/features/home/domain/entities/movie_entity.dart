import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable{
  final String image;
  final String title;
  final String overview;
  final String releaseDate;
  final num id;
  final num average;

  const MovieEntity({
    required this.image,
    required this.title,
    required this.id,
    required this.average,
    required this.overview,
    required this.releaseDate,
});

  @override
  List<Object?> get props => [
    image,
    title,
    overview,
    releaseDate,
    id,
    average,
  ];

}