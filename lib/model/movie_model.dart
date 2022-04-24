import 'package:flutter/material.dart';

class MovieModel {
  final String title;
  final String imdb_id;
  final String poster_url;
  final String rating;
  final String genre;

  MovieModel(
      {required this.title,
      required this.imdb_id,
      required this.poster_url,
      required this.rating,
      required this.genre});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['Title'],
      imdb_id: json['imdbID'],
      poster_url: json['Poster'].toString().startsWith("http://")
          ? json['Poster']
          : json['Poster'].toString().startsWith("https://")
              ? json['Poster']
              : "https://" + json['Poster'].toString(),
      rating: json['imdbRating'],
      genre: json['Genre'],
    );
  }
}
