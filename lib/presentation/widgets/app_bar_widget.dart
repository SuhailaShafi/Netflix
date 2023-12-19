import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          '$title',
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: kwhiteColor,
        ),
        kwidth,
        Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/avatar.png')))),
        kwidth,
      ],
    );
  }
}
