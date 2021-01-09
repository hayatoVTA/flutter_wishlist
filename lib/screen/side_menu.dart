import 'package:flutter/material.dart';
import 'package:flutter_wishlist/entities/category_entity.dart';
import 'package:flutter_wishlist/screen/choice_category.dart';
import 'package:flutter_wishlist/screen/home_screen.dart';
import 'package:flutter_wishlist/screen/setting_screen.dart';
import 'package:flutter_wishlist/screen/category_screen.dart';
import 'package:flutter_wishlist/view/style/text_style.dart';
import 'package:flutter_wishlist/view/style/theme_mode_notifier.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  List<Widget> _categoryList = List<Widget>();

  // CategoryEntity _categoryEntity = CategoryEntity();

  // @override
  // initState() {
  //   super.initState();
  //   getAllCategories();
  // }

  // getAllCategories() async {
  //   var categories = await _categoryEntity.readCategory();
  //
  //   categories.forEach((category) {
  //     setState(() {
  //       _categoryList.add(InkWell(
  //         onTap: () => Navigator.push(
  //           context,
  //           new MaterialPageRoute(
  //             builder: (context) => new ChoiceCategory(
  //               category: category['name'],
  //             ),
  //           ),
  //         ),
  //         child: ListTile(
  //           title: Text(category['name']),
  //         ),
  //       ));
  //     });
  //   });
  // }

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "ホーム",
              style: AppTextStyle.BoldBlack20,
            ),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          // ListTile(
          //   leading: Icon(Icons.list),
          //   title: Text(
          //     "カテゴリー",
          //     style: AppTextStyle.BoldBlack20,
          //   ),
          //   onTap: () => Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => CategoryScreen())),
          // ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "カラー設定",
              style: AppTextStyle.BoldBlack20,
            ),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SettingScreen())),
          ),
          // Column(
          //   children: _categoryList,
          // ),
        ],
      ),
    );
  }
}
