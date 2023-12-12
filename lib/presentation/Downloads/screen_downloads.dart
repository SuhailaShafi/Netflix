import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/Api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgettList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              return SizedBox(
                height: 25,
              );
            },
            itemCount: _widgettList.length));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    "https://www.themoviedb.org/t/p/w440_and_h660_face/nTMmpvR9TyV631tpFr4FtYxG0FC.jpg",
    "https://www.themoviedb.org/t/p/w440_and_h660_face/vBZ0qvaRxqEhZwl6LWmruJqWE8Z.jpg",
    "https://www.themoviedb.org/t/p/w440_and_h660_face/sp0fISNTyzttKfE0PB4ObG5ZRzC.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        kheight,
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        const Text(
          'We will download a personalized  selection of\n movies and shows for you ,'
          " so there's\n always something to watch on your\n device ",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kheight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(alignment: Alignment.center, children: [
            FutureBuilder(
                future: Api().getDownloadImageUrls(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none) {
                    return Center(
                      child: CircleAvatar(
                        radius: size.width * .31,
                        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
                        child: const CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: CircleAvatar(
                        radius: size.width * .31,
                        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
                        child: const CircularProgressIndicator(),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No data available');
                  } else {
                    return SizedBox(
                      // color: kWhiteColor,
                      width: size.width,
                      height: size.width * .7,
                      // color: Colors.white,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: size.width * .31,
                              backgroundColor:
                                  const Color.fromARGB(255, 27, 27, 27),
                            ),
                          ),
                          downloadsImageWidget(
                            image: snapshot.data![0],
                            margin: const EdgeInsets.only(left: 152, bottom: 5),
                            angle: 20,
                            size: Size(size.width * .4, size.width * .5),
                            radius: 10,
                          ),
                          downloadsImageWidget(
                            image: snapshot.data![1],
                            margin:
                                const EdgeInsets.only(right: 152, bottom: 5),
                            angle: -20,
                            size: Size(size.width * .4, size.width * .5),
                            radius: 10,
                          ),
                          downloadsImageWidget(
                            image: snapshot.data![2],
                            margin: const EdgeInsets.only(left: 0),
                            size: Size(size.width * .5, size.width * .5),
                            radius: 8,
                          ),
                        ],
                      ),
                    );
                  }
                })
          ]),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight,
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kbuttonColorBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: kwhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kbuttonColorWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See what you can download',
                style: TextStyle(
                    color: myblack, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
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
