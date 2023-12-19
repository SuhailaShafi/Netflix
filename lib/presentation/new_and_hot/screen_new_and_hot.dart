import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              actions: [
                const Icon(
                  Icons.menu,
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
              bottom: TabBar(
                  isScrollable: true,
                  labelColor: myblack,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelColor: kwhiteColor,
                  indicator: BoxDecoration(
                      color: kwhiteColor, borderRadius: kradius30),
                  tabs: const [
                    Tab(text: "🍿 Coming Soon"),
                    Tab(
                      text: "👀 Everyone's watching",
                    )
                  ]),
            )),
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ValueListenableBuilder(
      valueListenable: upComingListNotifeir,
      builder: (context, value, _) {
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            var data = value[index];
            return ComingSoonWidget(
              movie: data,
            );
          },
        );
      },
    );
  }

  Widget _buildEveryonesWatching() {
    return ValueListenableBuilder(
        valueListenable: topRatedListNotifeir,
        builder: (context, value, _) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              var data = value[index];
              return EveryonesWatchingWidget(
                movie: data,
              );
            },
          );
        });
  }
}
