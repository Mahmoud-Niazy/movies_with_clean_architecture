import 'package:equatable/equatable.dart';

class MovieRecommendationsEntity extends Equatable{
  final String? image;
  final int? id ;

  const MovieRecommendationsEntity({
     this.image,
     this.id,
});

  @override
  List<Object?> get props => [
    image,
    id,
  ];


}