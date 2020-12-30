import 'package:flutter/material.dart';
import 'package:flutter_wishlist/view/style/color.dart';
import 'package:flutter_wishlist/view/style/text_style.dart';
import 'package:flutter_wishlist/screen/side_menu.dart';

class SettingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          onPressed: () => Navigator.of(context).pop(),
          elevation: 0.0,
          child: Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
          color: AppColors.blue,
        ),
        title: Text(
          "設定",
        ),
        backgroundColor: AppColors.blue,
      ),
      drawer: SideMenu(),
    );
  }
}
