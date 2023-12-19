import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';
import 'package:intl/intl.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({super.key, required this.movie});
  final Movie movie;
  final DateFormat monthFormatter = DateFormat('MMM');
  final DateFormat dayFormatter = DateFormat('dd');
  final DateFormat dayFormatterDay = DateFormat('EEEE');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 70,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    monthFormatter
                        .format(DateTime.parse(movie.releaseDate))
                        .toUpperCase(),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: mygrey),
                  ),
                  Text(
                    dayFormatter.format(DateTime.parse(movie.releaseDate)),
                    style: const TextStyle(
                        letterSpacing: 4,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width - 70,
            height: 450,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              kheight,
              VideoWidget(
                image: movie.backdropPath,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.title.length > 15
                        ? '${movie.title.substring(0, 12)}...'
                        : movie.title,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -5),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.all_out_sharp,
                        title: 'Remind me',
                        iconSize: 18,
                        textSize: 12,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'info',
                        iconSize: 18,
                        textSize: 12,
                      ),
                      kwidth,
                    ],
                  ),
                ],
              ),
              kheight,
              Text(
                  'Coming on ${dayFormatter.format(DateTime.parse(movie.releaseDate))} ${monthFormatter.format(DateTime.parse(movie.releaseDate))}'),
              kheight,
              Text(movie.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              kheight,
              Text(
                truncateOverview(movie.overview, 50),
                style: const TextStyle(color: mygrey),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  String truncateOverview(String text, int maxWords) {
    List<String> words = text.split(' ');
    if (words.length <= maxWords) {
      return text;
    }
    return words.take(maxWords).join(' ') + '...';
  }
}
