import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/home/widgets/home_main_card.dart';
import 'package:netflix/presentation/home/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTextTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: MediaQuery.of(context).size.width * 0.5,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => const HomeMainCard()),
          ),
        )
      ],
    );
  }
}
