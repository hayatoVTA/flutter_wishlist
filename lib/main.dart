import 'package:flutter/material.dart';
import 'package:flutter_wishlist/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_wishlist/view/style/theme_mode_notifier.dart';

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeModeNotifier = Provider.of<ThemeModeNotifier>(context);
    return Center(
      child: MaterialApp(
        theme: themeModeNotifier.themeData,
        darkTheme: themeModeNotifier.darkThemeData,
        home: HomeScreen(),
      ),
    );
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeModeId = prefs.getInt(ThemeModeNotifier.selectedThemeKey);
  return runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModeNotifier(id: themeModeId),
      child: MyApp(),
    ),
  );
}
