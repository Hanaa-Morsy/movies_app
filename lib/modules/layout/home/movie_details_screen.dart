import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/screens_route_name.dart';
import 'package:movies_app/modules/layout/home/widgets/cast_container_widget.dart';
import 'package:movies_app/modules/layout/home/widgets/genres_container.dart';
import 'package:movies_app/modules/layout/home/widgets/screen_shot_container.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../providers/app_language_provider.dart';
import 'widgets/rate_container_widget.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({super.key});
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isTaped = false;

  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageProvider>(context);
    var arg = ModalRoute.of(context)!.settings.arguments as String;
    if (provider.movieDetails == null) {
      provider.getMovieDetails(arg);
      provider.getMovieSimilar(arg);
      provider.getMovieCast(arg);
    }
    return provider.movieDetails == null
        ? Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(provider.movieDetails!.bgImage),
                      fit: BoxFit.fill),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xff121312).withOpacity(0.8),
                    Color(0xff121312).withOpacity(0.6),
                  ], begin: Alignment.bottomCenter, end: Alignment(1, 0))),
                ),
              ),
              Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              isTaped = !isTaped;
                              setState(() {});
                            },
                            child: Icon(
                              isTaped == false
                                  ? Icons.bookmark_border
                                  : Icons.bookmark,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * .4,
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                      'assets/images/playicon.png')),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                provider.movieDetails!.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                provider.movieDetails!.year,
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xffADADAD)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final url =
                                        Uri.parse(provider.movieDetails!.link);
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    }
                                  },
                                  child: Text(
                                    'Watch',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffE82626),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                RateContainer(
                                  text: provider.movieDetails!.likeCount,
                                  iconData: Icons.favorite,
                                ),
                                RateContainer(
                                  text: provider.movieDetails!.runTime,
                                  iconData: Icons.watch_later,
                                ),
                                RateContainer(
                                  text: provider.movieDetails!.rating,
                                  iconData: Icons.star_rounded,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Screen Shots',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            provider.movieDetails!.screenShot1 == null
                                ? CircularProgressIndicator()
                                : ScreenShotContainer(
                                    image: provider.movieDetails!.screenShot1),
                            provider.movieDetails!.screenShot2 == null
                                ? CircularProgressIndicator()
                                : ScreenShotContainer(
                                    image: provider.movieDetails!.screenShot2),
                            provider.movieDetails!.screenShot3 == null
                                ? CircularProgressIndicator()
                                : ScreenShotContainer(
                                    image: provider.movieDetails!.screenShot3),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Similar',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            provider.moviesSimilar.length == 0
                                ? CircularProgressIndicator()
                                : SizedBox(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.height * .7,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: .7),
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: provider.moviesSimilar.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              provider.setNull();
                                              Navigator.of(context).pushNamed(
                                                  ScreenRouteName.movieDetails,
                                                  arguments: provider
                                                      .moviesSimilar[index].id);
                                            },
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            provider
                                                                .moviesSimilar[
                                                                    index]
                                                                .bgImage,
                                                          ),
                                                          fit: BoxFit.fill)),
                                                ),
                                                Positioned(
                                                  top: 8,
                                                  left: 8,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width: 60,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color:
                                                              Color(0xff121312)
                                                                  .withOpacity(
                                                                      .71)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            provider
                                                                .moviesSimilar[
                                                                    index]
                                                                .rating,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Icon(
                                                            Icons.star_rounded,
                                                            color: Color(
                                                                0xffF6BD00),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Summery',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                               ' ${provider.movieDetails!.summery}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cast',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                            provider.movieCast!.length == 0
                                ? CircularProgressIndicator()
                                :SizedBox(
                             height: MediaQuery.of(context).size.height*.5,
                             width: double.infinity,
                             child: ListView.builder(itemBuilder: (context, index) {
                              return CastContainerWidget(
                                   name: provider.movieCast![index].name,
                                   char: provider.movieCast![index].charName,
                                   img: provider.movieCast![index].image);

                             },itemCount: provider.movieCast!.length,
                               physics: NeverScrollableScrollPhysics(),

                             ),
                           ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Genres',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*.2,
                            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1.8),itemCount:provider.movieDetails!.genres.length , itemBuilder: (context, index) {
                             return GenresContainer(genre: provider.movieDetails!.genres[index]);
                            },),
                          )




                          ]),
                    ),
                  ))
            ],
          );
  }
}
