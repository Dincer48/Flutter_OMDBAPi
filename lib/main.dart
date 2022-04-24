import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:omdbapi/model/movie_model.dart';
import 'package:omdbapi/model/search_model.dart';
import 'package:omdbapi/screens/bottom_nav_bar.dart';
import 'package:omdbapi/utils/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox('Favorites');
  runApp(
    ChangeNotifierProvider<DarkLigthTheme>(
      create: (_) => DarkLigthTheme(),
      child: const MovieApp(),
    ),
  );
}

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkLigthTheme>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchModel>(create: (_) => SearchModel()),
      ],
      child: MaterialApp(
        theme:
            themeProvider.getDarkMode() ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const BottomNavBar(),
      ),
    );
  }
}
