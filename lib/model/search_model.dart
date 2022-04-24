import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdbapi/model/movie_model.dart';
import 'package:omdbapi/services/webservice.dart';

class SearchModel extends ChangeNotifier {
  // String? movieSearch;
  final List<MovieModel> list = [];

  void searchMovies(String movieSearch) async {
    try {
      list.clear();
      list.addAll(await Services.fetchData(movieSearch));
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
