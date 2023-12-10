import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

import 'package:netflix/presentation/MyNetflix/Downloads/screen_downloads.dart';
import 'package:netflix/presentation/Search/screen_search.dart';
import 'package:netflix/presentation/Search/widgets/search_idle.dart';
import 'package:netflix/presentation/fast_Laugh/screen_fast_laugh.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearchWidget(),
    ScreenDownloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: IndexChangeNotifier,
            builder: (context, int index, _) {
              return pages[index];
            }),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}