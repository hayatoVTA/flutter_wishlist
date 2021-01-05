import 'package:flutter/material.dart';
import 'package:flutter_wishlist/entities/task_entity.dart';
import 'package:flutter_wishlist/models/task.dart';
import 'package:flutter_wishlist/screen/list_screen.dart';
import 'package:flutter_wishlist/view/style/color.dart';
import 'package:flutter_wishlist/screen/side_menu.dart';
import 'package:flutter_wishlist/view/style/text_style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskEntity _taskEntity;

  List<Task> _taskList = List<Task>();

  initState() {
    super.initState();
    getAllTask();
  }

  getAllTask() async {
    _taskEntity = TaskEntity();
    _taskList = List<Task>();

    var task = await _taskEntity.readTask();

    task.forEach((task) {
      setState(() {
        var model = Task();
        model.id = task['id'];
        model.title = task['title'];
        model.category = task['category'];
        model.isFinished = task['isFinished'];
        model.taskDate = task['taskDate'];
        _taskList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
        backgroundColor: AppColors.blue,
      ),
      drawer: SideMenu(),
      body: ListView.builder(
        itemCount: _taskList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _taskList[index].title ?? 'タイトルはありません',
                      style: AppTextStyle.BoldBlack15,
                    ),
                  ],
                ),
                subtitle:
                    Text('カテゴリー：' + _taskList[index].category ?? 'カテゴリーはありません'),
                trailing:
                    Text('日付：' + _taskList[index].taskDate ?? '日付設定はありません'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ListScreen())),
        child: Icon(Icons.add),
        backgroundColor: AppColors.blue,
      ),
    );
  }
}
