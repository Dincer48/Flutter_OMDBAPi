import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../../utils/theme.dart';
import '../../widgets/favorites/emptyfavorites.dart';
import '../../widgets/favorites/favorites_movie_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkLigthTheme>(context);
    return Scaffold(
        backgroundColor: themeProvider.isDarkMode
            ? const Color(0xff171717)
            : const Color(0xffE6E6E6),
        appBar: AppBar(
          title: Text(
            "Favorites",
            style: TextStyle(
                color: themeProvider.isDarkMode
                    ? const Color(0xFF25C0C0)
                    : const Color(0xff171717),
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: ValueListenableBuilder<Box>(
                valueListenable: Hive.box('Favorites').listenable(),
                builder: (context, box, child) {
                  if (box.isEmpty) {
                    return const EmptyFavorites();
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        final info = box.getAt(i);

                        return Dismissible(
                          key: Key(info['id'].toString()),
                          onDismissed: (direction) {
                            box.deleteAt(i);
                          },
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(
                                CupertinoIcons.delete,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          child: FavoritesMovieCard(
                            poster: info['poster'],
                            name: info['title'],
                            genre: info['type'],
                            id: info['id'],
                            rate: info['rating'],
                          ),
                        );
                      },
                      itemCount: box.length);
                }),
          ),
        ]));
  }
}
