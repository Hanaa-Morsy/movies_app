
import 'package:flutter/material.dart';

class GenresContainer extends StatelessWidget {
   GenresContainer({
 required this.genre
  });
late String genre;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff282A28),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
          child: Center(
            child: Text(genre,style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),),
          ),
        ),
      ),
    );
  }
}
