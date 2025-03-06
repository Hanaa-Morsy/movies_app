
import 'dart:convert';

import 'package:movies_app/core/constants/api_constants/api_constants.dart';
import 'package:movies_app/core/constants/api_constants/end_points.dart';
import 'package:movies_app/models/high_rating_movies.dart';
import 'package:http/http.dart' as http;

abstract class SimilarApi{
  static Future<List<Movie>>getSimilarMovies(String id)async{
    try {
      var response=await http.get(
          Uri.https(
              ApiConstants.baseUrl,
              EndPoints.SimilarMovieEndPoint,
              {
                'movie_id':id,
              }

          )
      );
      Map<String,dynamic>data=json.decode(response.body);
      print(data);

      var higherRatingMoviesModel=HigherRatingMoviesModel.fromJson(data);
      return higherRatingMoviesModel.data.movie;

    }  catch (e) {
      throw Exception(e.toString());
      // TODO
    }
  }
}