import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 50,
          height: 450,
          child: Column(
            children: [
              Text(
                "FEB",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: mygrey),
              ),
              Text(
                "11",
                style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight,
                VideoWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TALL GIRL 2",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -5),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        CustomButtonWidget(
                          icon: Icons.all_out_sharp,
                          title: 'Remind me',
                          iconSize: 20,
                          textSize: 12,
                        ),
                        kwidth,
                        CustomButtonWidget(
                          icon: Icons.info,
                          title: 'info',
                          iconSize: 20,
                          textSize: 12,
                        ),
                        kwidth,
                      ],
                    ),
                  ],
                ),
                kheight,
                Text('Coming on friday'),
                kheight,
                Text('Tall Girl 2',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                kheight,
                Text(
                  'Landing the lead in the  school musical is a dream come true for jodi , until the pressure sends her confidence - and her relationship - into a tailspain ',
                  style: TextStyle(color: mygrey),
                ),
              ]),
        ),
      ],
    );
  }
}
