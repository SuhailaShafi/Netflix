import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
        Spacer(),
        Icon(
          Icons.menu,
          color: kwhiteColor,
        ),
        kwidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        kwidth,
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
