import 'package:flutter/material.dart';
import 'package:movies_app/network/cast_api.dart';
import 'package:movies_app/network/details_api.dart';
import 'package:movies_app/network/higher_rating_api.dart';
import 'package:movies_app/network/similar_api.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: FloatingActionButton(
        onPressed: (){
         DetailsApi.getAllDetails('3600');
        },
      ),
    );
  }
}





