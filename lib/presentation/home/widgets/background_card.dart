import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(image: (NetworkImage(kmainImage)))),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _PlayButton(),
                CustomButtonWidget(
                  icon: Icons.info,
                  title: 'Info',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: myblack),
        ),
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhiteColor)),
    );
  }
}
