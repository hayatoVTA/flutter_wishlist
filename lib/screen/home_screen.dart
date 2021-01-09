import 'package:flutter/material.dart';
import 'package:flutter_wishlist/entities/task_entity.dart';
import 'package:flutter_wishlist/models/task.dart';
import 'package:flutter_wishlist/screen/list_screen.dart';
import 'package:flutter_wishlist/screen/side_menu.dart';
import 'package:flutter_wishlist/view/style/text_style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskEntity _taskEntity = TaskEntity();

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
        model.isFinished = task['isFinished'];
        model.taskDate = task['taskDate'];
        _taskList.add(model);
      });
    });
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  _deleteFormDialog(BuildContext context, categoryId) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                color: Colors.red,
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "キャンセル",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FlatButton(
                color: Colors.green,
                onPressed: () async {
                  var result = await _taskEntity.deleteTask(categoryId);
                  if (result > 0) {
                    Navigator.pop(context);
                    getAllTask();
                    _showSuccessSnackBar(Text('削除しました'));
                  }
                },
                child: Text(
                  "削除",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            title: Text("タスクを削除する"),
          );
        });
  }

  _showSuccessSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    _globalKey.currentState.showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        _deleteFormDialog(context, _taskList[index].id);
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: Text(
                        _taskList[index].title,
                        style: AppTextStyle.BoldBlack15,
                      ),
                    ),
                  ],
                ),
                trailing: Text(_taskList[index].taskDate),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ListScreen())),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
