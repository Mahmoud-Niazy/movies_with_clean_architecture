import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/request_state.dart';
import '../../../domain/entities/genres_entity.dart';
import '../../controller/movie_details_bloc/movie_details_bloc.dart';
import '../../controller/movie_details_bloc/movie_details_state.dart';

class MovieDetailsWidget extends StatelessWidget{
  const MovieDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
      previous.movieDetailsRequestState !=
          current.movieDetailsRequestState,
      builder: (context, state) {
        // print('Build Details widget');
        switch (state.movieDetailsRequestState) {
          case RequestState.loaded:
            return SliverToBoxAdapter(
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.movieDetails!.title,
                          style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          )),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              state.movieDetails!.releaseDate
                                  .split('-')[0],
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                (state.movieDetails!.voteAverage / 2)
                                    .toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                '(${state.movieDetails!.voteAverage})',
                                style: const TextStyle(
                                  fontSize: 1.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16.0),
                          Text(
                            _showDuration(state.movieDetails!.runtime),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        state.movieDetails!.overview,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Genres: ${_showGenres(state.movieDetails!.genres)}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
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
  String _showGenres(List<GenresEntity> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}