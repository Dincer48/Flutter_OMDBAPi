import 'package:flutter/cupertino.dart';

class DarkLigthTheme extends ChangeNotifier {
  bool isDarkMode = false;
  getDarkMode() => isDarkMode;

  void changeDarkMode(isDarkMode) {
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }
}
