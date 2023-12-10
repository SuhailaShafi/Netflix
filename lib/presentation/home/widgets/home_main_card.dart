import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';

class HomeMainCard extends StatelessWidget {
  const HomeMainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w440_and_h660_face/sp0fISNTyzttKfE0PB4ObG5ZRzC.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: kradius10),
      ),
    );
  }
}
