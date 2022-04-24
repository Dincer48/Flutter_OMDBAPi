import 'package:flutter/material.dart';
import 'package:omdbapi/model/search_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/theme.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkLigthTheme>(context);
    return Consumer<SearchModel>(
      builder: (context, movies, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            style: TextStyle(
              color: themeProvider.isDarkMode
                  ? const Color(0xff20C0C0)
                  : const Color(0xff171717),
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: themeProvider.isDarkMode
                      ? const Color(0xff20C0C0)
                      : const Color(0xff171717),
                ),
              ),
              hintText: "Search movies.:)",
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 20,
              ),
              hintStyle: TextStyle(
                letterSpacing: .0,
                color: themeProvider.isDarkMode
                    ? const Color(0xff20C0C0)
                    : const Color(0xff171717),
              ),
              fillColor: Colors.white.withOpacity(.1),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(
                  color: themeProvider.isDarkMode
                      ? const Color(0xff20C0C0)
                      : const Color(0xff171717),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(
                  color: themeProvider.isDarkMode
                      ? const Color(0xff20C0C0)
                      : const Color(0xff171717),
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(
                  color: themeProvider.isDarkMode
                      ? const Color(0xff20C0C0)
                      : const Color(0xff171717),
                  width: 2,
                ),
              ),
            ),
            onSubmitted: (value) => movies.searchMovies(value),
            onChanged: (value) {
              movies.searchMovies(value);
            },
          ),
        );
      },
    );
  }
}
