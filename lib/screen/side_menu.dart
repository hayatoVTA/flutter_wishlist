import 'package:flutter/material.dart';
import 'package:flutter_wishlist/screen/wish_list_screen.dart';
import 'package:flutter_wishlist/screen/setting_screen.dart';
import 'package:flutter_wishlist/screen/category_screen.dart';
import 'package:flutter_wishlist/view/style/color.dart';
import 'package:flutter_wishlist/view/style/text_style.dart';

class SideMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 110,
            child: DrawerHeader(
              child: Text(
                "カテゴリー",
                style: AppTextStyle.BoldWhite20,
              ),
              decoration: BoxDecoration(
                color: AppColors.blue,
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "ホーム",
              style: AppTextStyle.BoldBlack20,
            ),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "設定",
              style: AppTextStyle.BoldBlack20,
            ),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SettingScreen())),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text(
              "カテゴリー",
              style: AppTextStyle.BoldBlack20,
            ),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CategoryScreen())),
          ),
        ],
      ),
    );
  }
}
