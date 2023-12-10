import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/home/widgets/home_main_card.dart';
import 'package:netflix/presentation/home/widgets/main_title.dart';

class HomeNumberCard extends StatelessWidget {
  const HomeNumberCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Stack(children: [
        Row(children: [
          SizedBox(
            width: 40,
            height: MediaQuery.of(context).size.width * 0.5,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w440_and_h660_face/sp0fISNTyzttKfE0PB4ObG5ZRzC.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: kradius10),
          ),
        ]),
        Positioned(
          left: 13,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 5,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: myblack,
                  decoration: TextDecoration.none,
                  decorationColor: myblack),
            ),
          ),
        )
      ]),
    );
  }
}
