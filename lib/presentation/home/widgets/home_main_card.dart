import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/model/movie.dart';

class HomeMainCard extends StatelessWidget {
  HomeMainCard({
    required this.movieList,
    super.key,
  });
  final Movie movieList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('$imagePath${movieList.posterPath}'),
              fit: BoxFit.cover,
            ),
            borderRadius: kradius10),
      ),
    );
  }
}
