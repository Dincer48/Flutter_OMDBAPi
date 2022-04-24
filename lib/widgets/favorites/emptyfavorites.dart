import 'package:flutter/material.dart';
import 'package:omdbapi/utils/theme.dart';
import 'package:provider/provider.dart';

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkLigthTheme>(context);
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite,
              size: 45,
              color: themeProvider.isDarkMode
                  ? Colors.white60
                  : Colors.black.withOpacity(.6),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Your Favorites is Empty",
              style: TextStyle(
                  color: themeProvider.isDarkMode
                      ? const Color(0xff20C0C0)
                      : Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
