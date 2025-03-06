
import 'package:flutter/material.dart';

class ScreenShotContainer extends StatelessWidget {
   ScreenShotContainer({
     required this.image,

  });
late String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height:
        MediaQuery.of(context).size.height *
            0.2,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(24),
            image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
