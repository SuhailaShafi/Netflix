import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: kbuttonColorBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Set Up',
                  style: TextStyle(
                      color: kwhiteColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
        kheight,
        SizedBox(
          child: MaterialButton(
            color: kbuttonColorWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See what you can download',
                style: TextStyle(
                    color: myblack, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
