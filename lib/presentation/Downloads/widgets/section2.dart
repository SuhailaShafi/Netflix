import 'package:flutter/material.dart';
import 'package:netflix/Api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/Downloads/screen_downloads.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});
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
                              radius: size.width * .6,
                              backgroundColor:
                                  const Color.fromARGB(255, 27, 27, 27),
                            ),
                          ),
                          downloadsImageWidget(
                            image: snapshot.data![0],
                            margin: const EdgeInsets.only(left: 152, bottom: 5),
                            angle: 20,
                            size: Size(size.width * .45, size.width * .5),
                            radius: 10,
                          ),
                          downloadsImageWidget(
                            image: snapshot.data![1],
                            margin:
                                const EdgeInsets.only(right: 152, bottom: 5),
                            angle: -20,
                            size: Size(size.width * .45, size.width * .5),
                            radius: 10,
                          ),
                          downloadsImageWidget(
                            image: snapshot.data![2],
                            margin: const EdgeInsets.only(left: 0),
                            size: Size(size.width * .42, size.width * .62),
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
