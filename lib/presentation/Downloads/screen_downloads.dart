import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/Downloads/widgets/section2.dart';
import 'package:netflix/presentation/Downloads/widgets/section3.dart';
import 'package:netflix/presentation/Downloads/widgets/smart_downloads.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgettList = [
    const SmartDownloads(),
    const Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (ctx, index) {
              return _widgettList[index];
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 25,
              );
            },
            itemCount: _widgettList.length));
  }
}

class downloadsImageWidget extends StatelessWidget {
  const downloadsImageWidget(
      {super.key,
      required this.image,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10});

  final String image;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          // margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('$imagePath$image'), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(radius)),
        ),
      ),
    );
  }
}
