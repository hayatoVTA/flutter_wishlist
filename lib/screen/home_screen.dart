import 'package:flutter/material.dart';
import 'package:flutter_wishlist/screen/list_screen.dart';
import 'package:flutter_wishlist/view/style/color.dart';
import 'package:flutter_wishlist/view/style/text_style.dart';
import 'package:flutter_wishlist/screen/side_menu.dart';
import 'package:flutter_wishlist/screen/task_list.dart';
import 'package:flutter_wishlist/screen/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wishlist/models/task_data.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
        backgroundColor: AppColors.blue,
      ),
      drawer: SideMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ListScreen())),
        child: Icon(Icons.add),
        backgroundColor: AppColors.blue,
      ),
    );
  }
}

// Scaffold(
// backgroundColor: AppColors.green,
// body: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// padding: EdgeInsets.only(
// top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// FloatingActionButton(
// onPressed: null,
// child: Icon(
// Icons.list,
// size: 30.0,
// color: AppColors.green,
// ),
// backgroundColor: AppColors.white,
// ),
// SizedBox(
// height: 10.0,
// ),
// Text(
// '私のリスト',
// style: TextStyle(
// color: AppColors.white,
// fontSize: 40.0,
// fontWeight: FontWeight.w700,
// ),
// ),
// ],
// ),
// ),
// Expanded(
// child: Container(
// padding: EdgeInsets.symmetric(horizontal: 20.0),
// decoration: BoxDecoration(
// color: AppColors.white,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// ),
// ),
// // child: TasksList(),
// ),
// ),
// ],
// ),
// );
