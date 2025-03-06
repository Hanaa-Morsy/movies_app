class MovieCast {
  final String status;
  final Data data;

  MovieCast({required this.status, required this.data});
  factory MovieCast.fromJson(Map<String, dynamic> json) {
    return MovieCast(status: json['status'], data: Data.fromJson(json['data']));
  }
}

class Data {
  final Movies movie;

  Data({required this.movie});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(movie: Movies.fromJson(json['movie']));
  }
}

class Movies {
  final String id;
  final List<Cast> cast;

  Movies({
    required this.id,
    required this.cast,
  });
  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'].toString(),
      cast: (json['cast'] as List).map((e) => Cast.fromJson(e)).toList(),
    );
  }
}

class Cast {
  final String name;
  final String charName;
  final String image;
  Cast({required this.name, required this.charName, required this.image});
  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
        name: json['name'],
        charName: json['character_name'],
        image: json['url_small_image']);
  }
}
