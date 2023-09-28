import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api_services/api_constance.dart';
import '../../../../../core/utils/request_state.dart';
import '../../controller/movie_details_bloc/movie_details_bloc.dart';
import '../../controller/movie_details_bloc/movie_details_state.dart';

class CustomSliverAppBar extends StatelessWidget{
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
      previous.movieDetailsRequestState !=
          current.movieDetailsRequestState,
      builder: (context, state) {
        // print('Build Sliver AppBar');
        switch (state.movieDetailsRequestState) {
          case RequestState.loaded:
            return SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.5, 1.0, 1.0],
                      ).createShader(
                        Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width,
                      imageUrl: ApiConstance.imageUrl(
                          state.movieDetails!.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
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
            return const SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: Center(
                  child: Text(
                    'Error',
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}