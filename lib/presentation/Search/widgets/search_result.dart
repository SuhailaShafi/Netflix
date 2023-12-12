import 'package:flutter/material.dart';
import 'package:netflix/Api/api.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/Search/widgets/title.dart';

final imageurl =
    'https://www.themoviedb.org/t/p/w500_and_h282_face/8FWC4tDWB1p006vwiubhai4a8iS.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.result});
  final String result;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
            child: FutureBuilder<List<Movie>>(
          future: Api().searchResult(result),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error loading data"),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No data found"),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.5,
                ),
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return MainCard(
                    movie: data,
                  );
                },
                itemCount: snapshot.data!.length,
              );
            }
          },
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('$imagePath${movie.posterPath}'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
