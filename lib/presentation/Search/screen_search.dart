import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/Search/widgets/debouncer.dart';
import 'package:netflix/presentation/Search/widgets/search_idle.dart';
import 'package:netflix/presentation/Search/widgets/search_result.dart';

class ScreenSearchWidget extends StatefulWidget {
  const ScreenSearchWidget({super.key});

  @override
  State<ScreenSearchWidget> createState() => _ScreenSearchWidgetState();
}

class _ScreenSearchWidgetState extends State<ScreenSearchWidget> {
  bool changer = false;

  final searchController = TextEditingController();

  final _debonucer = Debouncer(delay: const Duration(milliseconds: 500));

  final ValueNotifier<bool> showSearchResult = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoTextField(
              controller: searchController,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 48, 47, 47).withOpacity(0.4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              prefix: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
              ),
              placeholder: 'Search shows, movies...',
              placeholderStyle: const TextStyle(color: mygrey, fontSize: 16),
              suffix: ValueListenableBuilder<bool>(
                valueListenable: showSearchResult,
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      searchController.clear();
                      setState(() {
                        showSearchResult.value = false;
                        changer = false;
                      });
                    },
                    child: child,
                  );
                },
                child: ValueListenableBuilder(
                  valueListenable: showSearchResult,
                  builder: (context, value, _) {
                    return Visibility(
                      visible: value,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          CupertinoIcons.xmark_circle_fill,
                          color: Colors.grey,
                          size: 17,
                        ),
                      ),
                    );
                  },
                ),
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) async {
                _debonucer.call(() {
                  setState(() {
                    changer = true;
                    showSearchResult.value = true;
                    if (searchController.text.isEmpty) {
                      changer = false;
                      showSearchResult.value = false;
                    }
                  });
                });
              },
            ),
            Expanded(
              child: changer
                  ? SearchResultWidget(
                      result: searchController.text,
                    )
                  : SearchIdleWidget(),
            ),
          ],
        ),
      )),
    );
  }
}
