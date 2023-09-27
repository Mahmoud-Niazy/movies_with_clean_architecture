class ApiConstance {
  static const String apiBaseUrl = "https://api.themoviedb.org/3/movie/";
  static const String apiKey = "65375fef91566a4b8bec6a3d0e069942";

  static String getNowPlayingMoviesPath = "now_playing?api_key=$apiKey";
  static String getPopularMoviesPath = "popular?api_key=$apiKey";
  static String getTopRatedMoviesPath = 'top_rated?api_key=$apiKey';

}