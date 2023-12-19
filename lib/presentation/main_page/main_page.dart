import 'package:flutter/material.dart';
import 'package:netflix/presentation/Downloads/screen_downloads.dart';
import 'package:netflix/presentation/Search/screen_search.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final pages = [
    ScreenHome(),
    const ScreenNewAndHot(),
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
  }
}
