class MoviesDetailsModel {
  final String status;
  final Data data;

  MoviesDetailsModel({required this.status, required this.data});
  factory MoviesDetailsModel.fromJson(Map<String,dynamic>json){
    return MoviesDetailsModel(status: json['status'],
        data: Data.fromJson(json['data']));
  }

}

class Data {
  final MovieDetailsModel movieDetailsModel;

  Data({required this.movieDetailsModel});
  factory Data.fromJson(Map<String,dynamic>json){
    return Data(movieDetailsModel: MovieDetailsModel.fromJson(json['movie']));

  }

}

class MovieDetailsModel {
  final String id;
  final String link;
  final String title;
  final String year;
  final String rating;
  final String runTime;
  final List genres;
  final String bgImage;
  final String coverImage;
  final String likeCount;
  final String screenShot1;
  final String screenShot2;
  final String screenShot3;
  final String summery;


  MovieDetailsModel(
      {required this.id,
      required this.link,
      required this.title,
      required this.year,
      required this.rating,
      required this.runTime,
      required this.genres,
      required this.bgImage,
      required this.coverImage,
      required this.likeCount,
        required this.screenShot1,
        required this.screenShot2,
        required this.screenShot3,
      required this.summery});
  factory MovieDetailsModel.fromJson(Map<String,dynamic>json){
    return MovieDetailsModel(
        id: json['id'].toString(),
        link: json['url'],
        title: json['title'],
        year: json['year'].toString(),
        rating: json['rating'].toString(),
        runTime: json['runtime'].toString(),
        genres: json['genres'],
        bgImage: json['large_cover_image'],
        coverImage: json['medium_cover_image'],
        likeCount: json['like_count'].toString(),
      summery: json['description_intro'],
      screenShot1: json['large_screenshot_image1'],
        screenShot2: json['large_screenshot_image2'],
        screenShot3: json['large_screenshot_image3'],
    );



  }

}
