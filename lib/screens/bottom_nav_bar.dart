import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/theme.dart';
import '../widgets/bottom_tab_bar.dart';
import 'favorites/favorites_screen.dart';
import 'home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkLigthTheme>(context);
    buildCurrentPage(int i) {
      switch (i) {
        case 0:
          return const HomeScreen();
        case 1:
          return const FavoritesScreen();
        default:
          return Container();
      }
    }

    return Scaffold(
      body: buildCurrentPage(currentIndex),
      bottomNavigationBar: CustomCupertinoTabBar(
        border: Border(
          top: BorderSide(
            color: themeProvider.isDarkMode
                ? const Color(0xff20C0C0)
                : Colors.grey.shade800,
            width: .4,
          ),
        ),
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        inactiveColor: Colors.grey,
        activeColor: const Color(0xff20C0C0),
        currentIndex: currentIndex,
        iconSize: 26.0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.home),
            activeIcon: Icon(
              CupertinoIcons.house_fill,
              color: themeProvider.isDarkMode
                  ? const Color(0xff20C0C0)
                  : Colors.grey.shade800,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.heart),
            label: 'Favorites',
            activeIcon: Icon(
              CupertinoIcons.heart_solid,
              color: themeProvider.isDarkMode
                  ? const Color(0xff20C0C0)
                  : Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
