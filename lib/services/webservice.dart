import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:omdbapi/model/movie_model.dart';

import '../utils/constants.dart';

class Services {
  static Future<List<MovieModel>> fetchData(String search) async {
    String url = BASE_URL + "?apikey=" + API_KEY + "&s=" + search;
    final response = await http.get(Uri.parse(url));
    log(url);
    if (response.statusCode == 200) {
      return fetchRatingAndGenre(json.decode(response.body)['Search'] as List);
    } else {
      throw Exception('Failed to load movie');
    }
  }

  static Future<List<MovieModel>> fetchRatingAndGenre(
      List<dynamic> decode) async {
    List<MovieModel> resultList = [];
    for (dynamic i in decode) {
      String url = BASE_URL + "?apikey=" + API_KEY + "&i=" + i['imdbID'];
      log(url);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        resultList.add(MovieModel.fromJson(json.decode(response.body)));
      } else {
        throw Exception('Failed to load movie');
      }
    }
    return resultList;
  }
}
