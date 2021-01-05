import 'package:flutter/material.dart';
import 'package:flutter_wishlist/entities/category_entity.dart';
import 'package:flutter_wishlist/screen/choice_category.dart';
import 'package:flutter_wishlist/screen/home_screen.dart';
import 'package:flutter_wishlist/screen/setting_screen.dart';
import 'package:flutter_wishlist/screen/category_screen.dart';
import 'package:flutter_wishlist/view/style/color.dart';
import 'package:flutter_wishlist/view/style/text_style.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  List<Widget> _categoryList = List<Widget>();

  CategoryEntity _categoryEntity = CategoryEntity();

  @override
  initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _categoryEntity.readCategory();

    categories.forEach((category) {
      setState(() {
        _categoryList.add(InkWell(
          onTap: () => Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new ChoiceCategory(
                category: category['name'],
              ),
            ),
          ),
          child: ListTile(
            title: Text(category['name']),
          ),
        ));
      });
    });
  }

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
          Divider(),
          Column(
            children: _categoryList,
          ),
        ],
      ),
    );
  }
}
