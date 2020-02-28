part of tmdb_api;

class Keywords {
  ///Provides details about movies
  final TMDB _tmdb;
  final String _endPoint = 'keyword';
  Keywords(this._tmdb) : assert(_tmdb != null);

  ///Get the list of official genres for movies.
  ///
  ///For doc visit https://developers.themoviedb.org/3/genres/get-movie-list
  Future<Map> getDetails(int keywordId) {
    return _tmdb._query('$_endPoint/$keywordId');
  }

  /// Get the movies that belong to a keyword.
  ///
  /// We highly recommend using [movie.discover] instead of this method as it is much more flexible.
  Future<Map> getTvlist(int keywordId,
      {Parameters parameters, bool includeAdult = false}) {
    return _tmdb._query('$_endPoint/$keywordId',
        parameters: parameters,
        optionalQueries: ['include_adult=$includeAdult']);
  }
}