
import 'package:flutter/material.dart';

class CastContainerWidget extends StatelessWidget {
   CastContainerWidget({
     required this.name,
     required this.char,
     required this.img

  });
late String name;
late String char;
late String img;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
            color: Color(0xff282A28),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(borderRadius:BorderRadius.circular(16),
                  child: Image.network(img)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.6,
                    child: Text('Name : ${name}',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.7,
                  child:Text('Character : ${char}',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
