

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/constants/api_constants/api_constants.dart';
import 'package:movies_app/core/constants/api_constants/end_points.dart';

import '../models/movie_details_model.dart';

abstract class DetailsApi{
 static Future<MovieDetailsModel>getAllDetails(String id)async{

  try {

    var response=await http.get(
        Uri.https(
          ApiConstants.baseUrl,
          EndPoints.DetailsEndPoint,
          {
            'movie_id':id,
            'with_images':'true',
          }
        )
    );
    Map<String,dynamic>data=json.decode(response.body);
   print(data);
    var moviesDetailsModel=MoviesDetailsModel.fromJson(data);
    return moviesDetailsModel.data.movieDetailsModel;

  }  catch (e) {
   throw Exception(e.toString());
    // TODO
  }
  }
}