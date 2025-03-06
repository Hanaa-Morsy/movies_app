

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/constants/api_constants/api_constants.dart';
import 'package:movies_app/core/constants/api_constants/end_points.dart';
import 'package:movies_app/models/high_rating_movies.dart';


abstract class HigherRatingApi{
  static Future<List<Movie>>higherRatibgMovies()async{
    try {
      var response=await http.get(
          Uri.https(
              ApiConstants.baseUrl,
              EndPoints.RatingsEndPoint,
              {
                'sort_by':'rating',
              }

          )
      );
      Map<String,dynamic>data=json.decode(response.body);

      var higherRatingMoviesModel=HigherRatingMoviesModel.fromJson(data);
      return higherRatingMoviesModel.data.movie;

    }  catch (e) {
      throw Exception(e.toString());
      // TODO
    }
  }
}