import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/screens_route_name.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override


  int currentIndex = 0;

  @override
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageProvider>(context);
    if(provider.moviesByGenre.length==0){
    provider.getNewMovie();}
    if (provider.movieList.length == 0) {
      provider.getHigherRating();
    }

    return provider.movieList.length == 0
        ? Center(child: CircularProgressIndicator())
        : SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:
              NetworkImage(provider.movieList[currentIndex].bgImage),
              fit: BoxFit.cover),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff121312).withOpacity(0.8),
                Color(0xff121312).withOpacity(0.6),
              ], begin: Alignment.bottomCenter, end: Alignment(1, 0))),
          child: Column(
            children: [
              Image.asset('assets/images/Available Now.png'),
              Expanded(
                child: CarouselSlider.builder(
                    itemCount: provider.movieList.length,
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          provider.setNull();
                          Navigator.of(context).pushNamed(
                              ScreenRouteName
                                  .movieDetails,
                              arguments:
                              provider.movieList[index].id
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        provider.movieList[index].bgImage,
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 60,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                    Color(0xff121312).withOpacity(.71)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      provider.movieList[index].rating,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: Color(0xffF6BD00),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: .5,
                      enlargeCenterPage: true,
                      enlargeFactor: .4,
                      onPageChanged: (index, reason) {
                        currentIndex = index;
                        setState(() {});
                      },
                      height: MediaQuery.of(context).size.height * .4,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Image.asset('assets/images/Watch Now.png'),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      String genre = provider.genres[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 16.0, left: 8),
                            child: Row(
                              children: [
                                Text(
                                  genre.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'See More',
                                      style: TextStyle(
                                          color: Color(0xffF6BD00)),
                                    )),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xffF6BD00),
                                ),
                              ],
                            ),
                          ),
                          provider.moviesByGenre.containsKey(genre)
                              ? SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider
                                  .moviesByGenre[genre]!.length,
                              itemBuilder: (context, index) {
                                var movie = provider
                                    .moviesByGenre[genre]![index];
                                return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        provider.setNull();
                                        Navigator.of(context).pushNamed(
                                            ScreenRouteName
                                                .movieDetails,
                                            arguments:
                                            movie.id
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius
                                                .circular(16),
                                            child: Image.network(
                                              movie.bgImage,
                                              width: 130,
                                              height: 180,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 8,
                                            left: 8,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Container(
                                                width: 60,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        8),
                                                    color: Color(
                                                        0xff121312)
                                                        .withOpacity(
                                                        .71)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text(
                                                      movie.rating,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize:
                                                          15),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .star_rounded,
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
                                    ));
                              },
                            ),
                          )
                              : CircularProgressIndicator()
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: provider.genres.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}