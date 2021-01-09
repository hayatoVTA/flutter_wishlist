import 'package:flutter/material.dart';
import 'package:flutter_wishlist/screen/side_menu.dart';
import 'package:flutter_wishlist/view/style/theme_list_view.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "カラー設定",
        ),
      ),
      body: const SafeArea(
        child: ThemeListView(),
      ),
      drawer: SideMenu(),
    );
  }
}
