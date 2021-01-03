import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_wishlist/view/style/color.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var listTitleController = TextEditingController();

  var listDateController = TextEditingController();

  var _selectedValue;

  var _categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リストを作成する"),
        backgroundColor: AppColors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: listTitleController,
            decoration: InputDecoration(
              labelText: 'title',
              hintText: 'タイトルを入力',
            ),
          ),
          TextField(
            controller: listDateController,
            decoration: InputDecoration(
              labelText: 'data',
              hintText: '日付を入力',
              prefixIcon: InkWell(
                onTap: () {},
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
            onPressed: () {},
            color: AppColors.blue,
            child: Text(
              '作成する',
              style: TextStyle(color: AppColors.white),
            ),
          )
        ],
      ),
    );
  }
}
