import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/Api/api.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/main_title.dart';
import 'package:netflix/presentation/home/widgets/main_title_cards.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/home/widgets/top_animated_container.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
int randomIndex = 0;

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  fetchDatas() async {
    trendingNowListNotifeir.value = await Api().getTrendingMovies();
    topRatedListNotifeir.value = await Api().getTopRated();
    upComingListNotifeir.value = await Api().getUpComing();
    popularListNotifier.value = await Api().getPopularMovies();
    top10TvShowsInIndiaTodayListNotifeir.value =
        await Api().getTop10TvShowsInIndiaToday();
    final random = Random();
    randomIndex = random.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    fetchDatas();
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
                  child: Stack(children: [
                    ListView(children: [
                      //const BackgroundCard(),
                      FutureBuilder(
                          future: Api().getTrendingMovies(),
                          builder: (context, snapshot) => snapshot.hasData
                              ? BackgroundCard(
                                  img: snapshot.data![randomIndex].posterPath)
                              : const SizedBox(
                                  width: 350,
                                  height: 500,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )),
                      MainTitleCard(
                        title: 'Released in the past year',
                        movienotifier: popularListNotifier,
                      ),
                      kheight,
                      MainTitleCard(
                        title: 'Trending Now',
                        movienotifier: trendingNowListNotifeir,
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
                                child: ValueListenableBuilder(
                                  valueListenable: trendingNowListNotifeir,
                                  builder: (context, value, _) {
                                    return ListView.builder(
                                      itemCount: 10,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        var data = value[index];
                                        return HomeNumberCard(
                                          movie: data,
                                          index: index,
                                        );
                                      },
                                    );
                                  },
                                ))
                          ]),
                      kheight,
                      MainTitleCard(
                        title: 'Tense Dramas',
                        movienotifier: upComingListNotifeir,
                      ),
                      kheight,
                      MainTitleCard(
                        title: 'South Indian Cinema',
                        movienotifier: topRatedListNotifeir,
                      )
                    ]),
                    scrollNotifier.value == true
                        ? TopAnimatedContainer()
                        : kheight,
                  ]));
            }));
  }
}
