import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/Search/widgets/title.dart';

class SearchIdleWidget extends StatelessWidget {
  SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const SearchTextTitle(
          title: 'Recommended TV shows & Movies',
        ),
        kheight,
        Expanded(
          child: FutureBuilder(
            future: Api().forSearchDara(),
            builder: (context, snapshot) {
              if (snapshot.hasError ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return TopSearchItemTile(
                        movie: data,
                      );
                    },
                    separatorBuilder: (context, index) => kheight,
                    itemCount: snapshot.data!.length);
              }
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("$imagePath${movie.backdropPath}"),
                  fit: BoxFit.cover)),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Text(
            movie.title,
            style: const TextStyle(
                color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        )),
        const Icon(
          CupertinoIcons.play_circle,
          color: kwhiteColor,
          size: 30,
        )
      ],
    );
  }
}
