import 'package:flutter/material.dart';
import 'package:netflix/model/movie.dart';

const String apiKey = 'd659b62746090c95531c32fa2a972674';
const kwidth = SizedBox(
  width: 10,
);
const kheight = SizedBox(
  height: 10,
);
const kheight20 = SizedBox(
  height: 20,
);
const kheight50 = SizedBox(
  height: 50,
);
//radius
BorderRadius kradius10 = BorderRadius.circular(10);
BorderRadius kradius30 = BorderRadius.circular(30);
//image
const kmainImage =
    "https://www.themoviedb.org/t/p/w440_and_h660_face/jFt1gS4BGHlK8xt76Y81Alp4dbt.jpg";
//textstyle
TextStyle kHomeTitleStyle =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
// notifiers
ValueNotifier<List<Movie>> trendingNowListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> topRatedListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> top10TvShowsInIndiaTodayListNotifeir =
    ValueNotifier([]);
ValueNotifier<List<Movie>> upComingListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> popularListNotifier = ValueNotifier([]);
ValueNotifier<List<Movie>> searchResultListNotifeir = ValueNotifier([]);
//Image path
const imagePath = 'https://image.tmdb.org/t/p/w500';
