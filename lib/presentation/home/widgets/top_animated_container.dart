import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';

class TopAnimatedContainer extends StatelessWidget {
  const TopAnimatedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 1000),
      width: double.infinity,
      height: 80,
      color: Colors.black.withOpacity(0.03),
      child: Column(children: [
        Row(
          children: [
            Image.asset(
              'assets/images/newlogo.jpg',
              width: 50,
              height: 40,
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
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'TV shows',
              style: kHomeTitleStyle,
            ),
            Text(
              'Movies',
              style: kHomeTitleStyle,
            ),
            Text(
              'Categories',
              style: kHomeTitleStyle,
            )
          ],
        )
      ]),
    );
  }
}
