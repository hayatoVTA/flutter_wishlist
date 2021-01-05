import 'dart:ffi';
import 'package:flutter_wishlist/models/task.dart';
import 'package:flutter_wishlist/entities/task_entity.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_wishlist/entities/category_entity.dart';
import 'package:flutter_wishlist/view/style/color.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var _taskTitleController = TextEditingController();

  var _taskDateController = TextEditingController();

  var _selectedValue;

  var _categories = List<DropdownMenuItem>();

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  _loadCategories() async {
    var _categoryEntity = CategoryEntity();
    var categories = await _categoryEntity.readCategory();
    categories.forEach((category) {
      setState(() {
        _categories.add(DropdownMenuItem(
          child: Text(category['name']),
          value: category['name'],
        ));
      });
    });
  }

  DateTime _dateTime = DateTime.now();

  _selectedListDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _taskDateController.text = DateFormat('yyyy-MM-dd').format(_pickedDate);
      });
    }
  }

  _showSuccessSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    _globalKey.currentState.showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("リストを作成する"),
        backgroundColor: AppColors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskTitleController,
              decoration: InputDecoration(
                labelText: 'title',
                hintText: 'タイトルを入力',
              ),
            ),
            TextField(
              controller: _taskDateController,
              decoration: InputDecoration(
                labelText: 'data',
                hintText: '日付を入力',
                prefixIcon: InkWell(
                  onTap: () {
                    _selectedListDate(context);
                  },
                  child: Icon(Icons.calendar_today),
                ),
              ),
            ),
            DropdownButtonFormField(
              items: _categories,
              value: _selectedValue,
              hint: Text('カテゴリー'),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () async {
                var taskObject = Task();

                taskObject.title = _taskTitleController.text;
                taskObject.isFinished = 0;
                taskObject.category = _selectedValue.toString();
                taskObject.taskDate = _taskDateController.text;

                var _taskEntity = TaskEntity();
                var result = await _taskEntity.saveTask(taskObject);

                if (result > 0) {
                  _showSuccessSnackBar(Text('作成しました'));
                }

                print(result);
                print(taskObject.title);
              },
              color: AppColors.blue,
              child: Text(
                '作成する',
                style: TextStyle(color: AppColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
