class HigherRatingMoviesModel{

  final String status;
  final Data data;

  HigherRatingMoviesModel({required this.status, required this.data});
  factory HigherRatingMoviesModel.fromJson(Map<String,dynamic>json){
  return HigherRatingMoviesModel(status: json['status'],
  data: Data.fromJson(json['data']));
  }

  }

  class Data {
  final List<Movie>movie;

  Data({required this.movie});
  factory Data.fromJson(Map<String,dynamic>json){
  return Data(movie: (json['movies'] as List).map((e) => Movie.fromJson(e)).toList());
  }

  }

  class Movie {
  final String id;
  final String rating;
  final String bgImage;




  Movie(
  {required this.id,
  required this.rating,
  required this.bgImage,


  });
  factory Movie.fromJson(Map<String,dynamic>json){
  return Movie(
  id: json['id'].toString(),
  rating: json['rating'].toString(),
  bgImage: json['medium_cover_image'],

  );

  }

}