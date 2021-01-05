import 'package:flutter/material.dart';
import 'package:flutter_wishlist/entities/task_entity.dart';
import 'package:flutter_wishlist/models/task.dart';
import 'package:flutter_wishlist/view/style/color.dart';
import 'package:flutter_wishlist/view/style/text_style.dart';

class ChoiceCategory extends StatefulWidget {
  final String category;
  ChoiceCategory({this.category});

  @override
  _ChoiceCategoryState createState() => _ChoiceCategoryState();
}

class _ChoiceCategoryState extends State<ChoiceCategory> {
  List<Task> _taskList = List<Task>();
  TaskEntity _taskEntity = TaskEntity();

  @override
  void initState() {
    super.initState();
    getTaskByChoiceCategories();
  }

  getTaskByChoiceCategories() async {
    var task = await _taskEntity.readTaskByChoiceCategory(this.widget.category);
    task.forEach((task) {
      setState(() {
        var model = Task();
        model.title = task['title'];
        model.taskDate = task['taskDate'];

        _taskList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task by category'),
        backgroundColor: AppColors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
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
                                _taskList[index].title,
                                style: AppTextStyle.BoldBlack15,
                              ),
                            ],
                          ),
                          subtitle: Text('カテゴリー：' + _taskList[index].category),
                          trailing: Text('日付：' + _taskList[index].taskDate),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
