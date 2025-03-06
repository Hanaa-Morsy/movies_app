class NewestMovieModel {
  final String status;
  final Data data;

  NewestMovieModel({required this.status, required this.data});
  factory NewestMovieModel.fromJson(Map<String, dynamic> json) {
    return NewestMovieModel(
        status: json['status'], data: Data.fromJson(json['data']));
  }
}

class Data {
  final List<NewMovie> newMovie;

  Data({required this.newMovie});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        newMovie:
            (json['movies'] as List).map((e) => NewMovie.fromJson(e)).toList());
  }
}

class NewMovie {
  final String id;
  final String rating;
  final String bgImage;

  NewMovie({
    required this.id,
    required this.rating,
    required this.bgImage,
  });
  factory NewMovie.fromJson(Map<String, dynamic> json) {
    return NewMovie(
      id: json['id'].toString(),
      rating: json['rating'].toString(),
      bgImage: json['large_cover_image'],
    );
  }
}
