import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/screens_route_name.dart';

class Home extends StatelessWidget {
  Home({super.key});
  String movieBg = 'assets/images/bghome.png';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bghome.png'), fit: BoxFit.fill),
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
                    itemCount: 8,
                    itemBuilder: (context, index, realIndex) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/bghome.png',
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width:60,
                              height:30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xff121312).withOpacity(.71)),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '7.7',
                                    style: TextStyle(
                                      color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                SizedBox(
                                  width: 5,
                                ),
                                  Icon(Icons.star_rounded , color: Color(0xffF6BD00),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: .5,
                      enlargeCenterPage: true,
                      enlargeFactor: .4,
                      height: MediaQuery.of(context).size.height * .4,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Image.asset('assets/images/Watch Now.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Action',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'See More',
                          style: TextStyle(color: Color(0xffF6BD00)),
                        )),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xffF6BD00),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  ScreenRouteName.movieDetails,
                                  arguments: MovieData(movieBg: movieBg));
                            },
                            child: Image.asset(
                              'assets/images/bghome.png',
                              width: 150,
                            )),
                        Image.asset(
                          'assets/images/bghome.png',
                          width: 150,
                        ),
                        Image.asset(
                          'assets/images/bghome.png',
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MovieData {
  String movieBg;
  MovieData({required this.movieBg});
}
