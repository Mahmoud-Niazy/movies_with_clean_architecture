import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/service_locator/service_locator.dart';
import 'package:movie/features/home/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie/features/home/presentation/controller/movie_details_bloc/movie_details_event.dart';
import 'package:movie/features/home/presentation/view/widgets/custom_sliver_app_bar.dart';
import 'package:movie/features/home/presentation/view/widgets/list_of_movie_recommendations.dart';
import 'package:movie/features/home/presentation/view/widgets/movie_details_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailContent(
        id: id,
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  final int id;

  const MovieDetailContent({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<MovieDetailsBloc>()
        ..add(FetchMovieDetailsEvent(id))
        ..add(FetchMovieRecommendationsEvent(id)),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        key: const Key('movieDetailScrollView'),
        slivers: [
          const CustomSliverAppBar(),

          const MovieDetailsWidget(),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            sliver: SliverToBoxAdapter(
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Text(
                  'More like this'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
          // Tab(text: 'More like this'.toUpperCase()),
          const ListOfMovieRecommendations(),
        ],
      ),
    );
  }
}
