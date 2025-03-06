import 'package:flutter/material.dart';
import 'package:movies_app/models/high_rating_movies.dart';
import 'package:movies_app/network/cast_api.dart';
import 'package:movies_app/network/higher_rating_api.dart';
import 'package:movies_app/network/similar_api.dart';

import '../models/cast_model.dart';
import '../models/movie_details_model.dart';
import '../models/newest_movie_model.dart';
import '../network/details_api.dart';
import '../network/newest_movie_api.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = "en";
  List<String> genres = [
    'action',
    'adventure',
    'animation',
    'biography',
    'comedy',
    'crime',
    'documentary',
    'drama',
    'family',
    'fantasy',
    'film_noir',
    'game_show',
    'history',
    'horror',
    'music',
    'musical',
    'mystery',
    'news',
    'reality_tv',
    'romance',
    'sci_fi',
    'short',
    'sport',
    'talk_show',
    'thriller',
    'war',
    'western'
  ];
  List<Movie> _moviesList = [];
  List<Movie> get movieList => _moviesList;
  Map<String, List<NewMovie>> _moviesByGenre = {};
  Map<String, List<NewMovie>> get moviesByGenre => _moviesByGenre;
  List<Movie> _moviesSimilar= [];
  List<Movie> get moviesSimilar => _moviesSimilar;
  MovieDetailsModel? _movieDetails ;
  MovieDetailsModel? get movieDetails => _movieDetails;
  List<Cast>?_movieCast;
  List<Cast>? get movieCast=>_movieCast;
  void setNull (){
    _movieDetails=null;
  }

  changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }

    appLanguage = newLanguage;
    notifyListeners();
  }

Future<void>  getHigherRating() async {
    _moviesList = await HigherRatingApi.higherRatibgMovies();
    notifyListeners();
  }

  Future<void> getNewMovie() async {
    for (String genre in genres) {
      if (!_moviesByGenre.containsKey(genre)) {
        _moviesByGenre[genre] = await NewestMovieApi.newestMovies(genre);
      }
    }
    notifyListeners();
  }
  Future<void> getMovieDetails(String id) async {
    _movieDetails= await DetailsApi.getAllDetails(id);
      notifyListeners();
    }
    Future <void>getMovieSimilar(String id)async{
    _moviesSimilar=await SimilarApi.getSimilarMovies(id);
    }
  Future <void>getMovieCast(String id)async{
    _movieCast=await CastApi.getCast(id);
  }


}
