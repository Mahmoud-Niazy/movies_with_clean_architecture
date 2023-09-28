class ApiConstance {
  static const String apiBaseUrl = "https://api.themoviedb.org/3/movie/";
  static const String apiKey = "65375fef91566a4b8bec6a3d0e069942";

  static String getNowPlayingMoviesPath = "now_playing?api_key=$apiKey";
  static String getPopularMoviesPath = "popular?api_key=$apiKey";
  static String getTopRatedMoviesPath = 'top_rated?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path)=>"$baseImageUrl$path";

  static String fetchMovieDetailsPath(int id) =>'$id?api_key=$apiKey';

  static String fetchMovieRecommendations(int id) => '$id/recommendations?api_key=$apiKey';

}