import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/theme.dart';

class FavoritesMovieCard extends StatelessWidget {
  final String poster;
  final String name;
  final String genre;
  final double rate;
  final String id;
  const FavoritesMovieCard({
    Key? key,
    required this.poster,
    required this.name,
    required this.id,
    required this.rate,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkLigthTheme>(context);
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
                color: themeProvider.isDarkMode
                    ? const Color.fromARGB(255, 104, 104, 104)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.20,
                    image: NetworkImage(poster),
                    placeholder:
                        const AssetImage('assets/images/placeholder.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      genre,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: double.parse(rate.toString()) > 7
                            ? Colors.green
                            : double.parse(rate.toString()) > 4
                                ? Colors.blue
                                : Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 18.0),
                        child: Text(
                          rate.toString() + " IMDB",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
