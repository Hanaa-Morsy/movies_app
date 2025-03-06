
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/constants/api_constants/api_constants.dart';
import 'package:movies_app/core/constants/api_constants/end_points.dart';
import 'package:movies_app/models/newest_movie_model.dart';


abstract class NewestMovieApi{
  static Future<List<NewMovie>>newestMovies(String genres)async{
    try {
      var response=await http.get(
          Uri.https(
              ApiConstants.baseUrl,
              EndPoints.RatingsEndPoint,
              {
                'sort_by':'year',
                'genre':genres,

              }

          )
      );
      Map<String,dynamic>data=json.decode(response.body);
      var newestMovieModel=NewestMovieModel.fromJson(data);
      return newestMovieModel.data.newMovie;

    }  catch (e) {
      throw Exception(e.toString());
      // TODO
    }
  }
}