import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:omdbapi/utils/theme.dart';
import 'package:provider/provider.dart';

import 'movies/movies_list.dart';
import 'movies/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkLigthTheme>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? const Color(0xff171717)
          : const Color(0xffE6E6E6),
      appBar: AppBar(
        title: Text(
          "DKMovie",
          style: TextStyle(
              color: isDarkMode
                  ? const Color(0xFF25C0C0)
                  : const Color(0xff171717),
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlutterSwitch(
            value: themeProvider.getDarkMode(),
            onToggle: (value) {
              setState(() {
                themeProvider.changeDarkMode(value);
                isDarkMode = !isDarkMode;
              });
            },
            height: 30,
            width: 60,
            activeColor: const Color(0xFF25C0C0),
            activeToggleColor: const Color(0xff171717),
            inactiveColor: const Color(0xff171717),
            activeIcon: const Icon(
              Icons.nightlight_round,
              color: Colors.white,
            ),
            inactiveIcon: const Icon(
              Icons.wb_sunny,
              color: Color(0xFFFFDF5D),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(),
            ),
            const MoviesList()
          ],
        ),
      ),
    );
  }
}
