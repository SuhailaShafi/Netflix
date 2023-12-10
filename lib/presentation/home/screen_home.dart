import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/Search/widgets/search_idle.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/home/widgets/home_main_card.dart';
import 'package:netflix/presentation/home/widgets/main_title.dart';
import 'package:netflix/presentation/home/widgets/main_title_cards.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        BackgroundCard(),
                        const MainTitleCard(
                          title: 'Released in the past year',
                        ),
                        kheight,
                        const MainTitleCard(
                          title: 'Trending Now',
                        ),
                        kheight,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MainTextTitle(
                                title: 'Top 10 TV Shows In India Today'),
                            kheight,
                            LimitedBox(
                              maxHeight:
                                  MediaQuery.of(context).size.width * 0.5,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    10,
                                    (index) => HomeNumberCard(
                                          index: index,
                                        )),
                              ),
                            )
                          ],
                        ),
                        kheight,
                        const MainTitleCard(title: 'Tense Dramas'),
                        kheight,
                        const MainTitleCard(title: 'South Indian Cinema'),
                      ],
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: Duration(microseconds: 1000),
                            width: double.infinity,
                            height: 80,
                            color: Colors.black.withOpacity(0.03),
                            child: Column(children: [
                              Row(
                                children: [
                                  Image.network(
                                    'https://cdn.vox-cdn.com/thumbor/pNxD2NFOCjbljnMPUSGdkFWeDjI=/0x0:3151x2048/1400x788/filters:focal(1575x1024:1576x1025)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png',
                                    width: 60,
                                    height: 60,
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.cast,
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
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                          )
                        : kheight,
                  ],
                ),
              );
            }));
    // TODO: implement build
    throw UnimplementedError();
  }
}
