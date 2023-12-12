import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/home/widgets/home_main_card.dart';
import 'package:netflix/presentation/home/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    required this.title,
    required this.movienotifier,
    super.key,
  });
  final String title;
  final ValueNotifier<List<Movie>> movienotifier;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTextTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: MediaQuery.of(context).size.width * 0.5,
          child: ValueListenableBuilder(
            valueListenable: movienotifier,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var data = value[index];
                  return HomeMainCard(
                    movieList: data,
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
