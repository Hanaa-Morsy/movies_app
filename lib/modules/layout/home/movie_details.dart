import 'package:flutter/material.dart';
import 'package:movies_app/modules/layout/home/home_screen.dart';

import 'widgets/rate_container_widget.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({super.key});

  @override


  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isTaped = false;

  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as MovieData;
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(arg.movieBg), fit: BoxFit.fill),
          ),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xff121312).withOpacity(0.8),
                Color(0xff121312).withOpacity(0.6),
              ], begin: Alignment.bottomCenter, end: Alignment(1, 0))),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: Colors.white,
                                )),
                            GestureDetector(
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
                          ],
                        ),
                        Center(
                            child: SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .4,
                          child: GestureDetector(
                              onTap: () {},
                              child: Image.asset('assets/images/playicon.png')),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Doctor Strange in the Multiverse of Madness',
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
                            '2022',
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
                              onPressed: () {},
                              child: Text(
                                'Watch',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffE82626),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            RateContainer(
                              text: '15',
                              iconData: Icons.favorite,
                            ),
                            RateContainer(
                              text: '90',
                              iconData: Icons.watch_later,
                            ),
                            RateContainer(
                              text: '7.6',
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/bghome.png',
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height*.6,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    height:
                                    MediaQuery.of(context).size.height * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/bghome.png',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                );
                              },),
                        )
                      ]),
                ),
              ))),
    );
  }
}
