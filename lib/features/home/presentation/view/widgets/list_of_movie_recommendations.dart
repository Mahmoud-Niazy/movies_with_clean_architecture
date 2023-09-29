import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/presentation/view/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/api_services/api_constance.dart';
import '../../../../../core/functions/navigate.dart';
import '../../../../../core/utils/request_state.dart';
import '../../../domain/entities/movie_recommendations_entity.dart';
import '../../controller/movie_details_bloc/movie_details_bloc.dart';
import '../../controller/movie_details_bloc/movie_details_state.dart';

class ListOfMovieRecommendations extends StatelessWidget {
  const ListOfMovieRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.movieRecommendationsRequestState !=
          current.movieRecommendationsRequestState,
      builder: (context, state) {
        // print('Build List Of Recommendations');
        switch (state.movieRecommendationsRequestState) {
          case RequestState.loaded:
            return SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
              sliver: _showRecommendations(state.movieRecommendations),
            );
          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          case RequestState.error:
            return SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: Center(
                  child: Text(
                    state.movieRecommendationsMessage,
                  ),
                ),
              ),
            );
        }
      },
    );
  }

  Widget _showRecommendations(
      List<MovieRecommendationsEntity> recommendations) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final recommendation = recommendations[index];
          return FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: InkWell(
              onTap: () {
                if(recommendation.image!= null){
                  navigate(
                    context: context,
                    screen: MovieDetailScreen(id: recommendation.id!),
                  );
                }
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: CachedNetworkImage(
                  imageUrl: ApiConstance.imageUrl(recommendation.image ?? ""),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 170.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        childCount: recommendations.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }
}
