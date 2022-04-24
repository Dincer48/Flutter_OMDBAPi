import 'package:flutter/material.dart';
import 'package:omdbapi/model/search_model.dart';
import 'package:provider/provider.dart';

import 'movies.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchModel>(builder: (context, movies, child) {
      return Container(
        child: movies.list.isEmpty
            ? Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4),
                  child: const Text(
                    "Enter the name of movie",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            : Flexible(
                child: ListView.builder(
                  itemCount: movies.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MoviesTile(
                      item: movies.list[index],
                    );
                  },
                ),
              ),
      );
    });
  }
}
