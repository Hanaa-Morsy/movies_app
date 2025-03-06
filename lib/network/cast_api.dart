import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/constants/api_constants/end_points.dart';
import 'package:movies_app/models/cast_model.dart';

import '../core/constants/api_constants/api_constants.dart';

abstract class CastApi{
  static Future<List<Cast>>getCast(String id)async{

    try {

      var response=await http.get(
          Uri.https(
              ApiConstants.baseUrl,
              EndPoints.DetailsEndPoint,
              {
                'movie_id':id,
                'with_cast':'true'
              }
          )
      );
      Map<String,dynamic>data=json.decode(response.body);
      print(data);
      var movieCast=MovieCast.fromJson(data);
      return movieCast.data.movie.cast;

    }  catch (e) {
      throw Exception(e.toString());
      // TODO
    }
  }
}