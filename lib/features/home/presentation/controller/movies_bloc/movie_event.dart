abstract class MovieEvent {
  const MovieEvent();
}

class FetchNowPlayingMoviesEvent extends MovieEvent{}
class FetchPopularMoviesEvent extends MovieEvent{}
class FetchTopRatedMoviesEvent extends MovieEvent{}