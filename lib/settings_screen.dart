import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: themeProvider.currentThemeData.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Customize Your Experience',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.currentThemeData.primaryColor,
                  ),
                ),
              ),
              
              // Theme Section
              Text(
                'Choose Theme:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: themeProvider.currentThemeData.primaryColor,
                ),
              ),
              SizedBox(height: 10),
              ...themeProvider.themes.keys.map((theme) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: Icon(
                      Icons.color_lens,
                      color: themeProvider.currentTheme == theme
                          ? themeProvider.currentThemeData.primaryColor
                          : Colors.grey,
                    ),
                    title: Text(
                      theme,
                      style: TextStyle(
                        color: themeProvider.currentTheme == theme
                            ? themeProvider.currentThemeData.primaryColor
                            : Colors.black,
                      ),
                    ),
                    onTap: () {
                      themeProvider.changeTheme(theme);
                    },
                  ),
                );
              }).toList(),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),

              // Font Section
              Text(
                'Choose Font:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: themeProvider.currentThemeData.primaryColor,
                ),
              ),
              SizedBox(height: 10),
              ...themeProvider.fonts.map((font) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: Icon(
                      Icons.font_download,
                      color: themeProvider.currentFont == font
                          ? themeProvider.currentThemeData.primaryColor
                          : Colors.grey,
                    ),
                    title: Text(
                      font,
                      style: TextStyle(
                        fontFamily: font,
                        color: themeProvider.currentFont == font
                            ? themeProvider.currentThemeData.primaryColor
                            : Colors.black,
                      ),
                    ),
                    onTap: () {
                      themeProvider.changeFont(font);
                    },
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
