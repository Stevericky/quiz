import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  final Map<String, Map<String, dynamic>> _themes = {
    'Theme A': {
      'themeData': ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      'backgroundImage': 'https://tse1.mm.bing.net/th?id=OIP.qa7blBJb0YvhSF-1TYYOSgHaFQ&pid=Api&P=0&h=220',
    },
    'Theme B': {
      'themeData': ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      'backgroundImage': 'https://www.gymleco.com/wp-content/uploads/2022/07/Black_gym_Taipa.jpeg',
    },
    'Theme C': {
      'themeData': ThemeData(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: const Color.fromARGB(255, 247, 246, 246),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      'backgroundImage': 'https://www.teahub.io/photos/full/137-1376137_background-hutan-pinus-hd.jpg',
    },
  };

  final List<String> _fonts = ['Arial', 'Times New Roman', 'Dancing Script'];

  String _currentTheme = 'Theme A';
  String _currentFont = 'Arial';

  Map<String, Map<String, dynamic>> get themes => _themes;

  String get currentTheme => _currentTheme;
  ThemeData get currentThemeData => _themes[_currentTheme]!['themeData'];
  String get currentBackgroundImage => _themes[_currentTheme]!['backgroundImage'];

  List<String> get fonts => _fonts;
  String get currentFont => _currentFont;

  void changeTheme(String themeName) {
    if (_themes.containsKey(themeName)) {
      _currentTheme = themeName;
      notifyListeners();
    }
  }

  void changeFont(String fontName) {
    if (_fonts.contains(fontName)) {
      _currentFont = fontName;
      notifyListeners(); 
    }
  }
}
