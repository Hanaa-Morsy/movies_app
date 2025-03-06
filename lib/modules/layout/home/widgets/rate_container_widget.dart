
import 'package:flutter/material.dart';

class RateContainer extends StatelessWidget {
   RateContainer({
    required this.iconData,
    required this.text,

  });
late String text;
late IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xff282A28)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
               Icon(iconData , color: Color(0xffF6BD00),),
                Spacer(),
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                  color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
