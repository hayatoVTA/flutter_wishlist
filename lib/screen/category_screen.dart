import 'package:flutter/material.dart';
import 'package:flutter_wishlist/entities/category_entity.dart';
import 'package:flutter_wishlist/models/category.dart';
import 'package:flutter_wishlist/screen/wish_list_screen.dart';
import 'package:flutter_wishlist/view/style/color.dart';
import 'package:flutter_wishlist/view/style/text_style.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var _categoryNameController = TextEditingController();

  var _category = Category();
  var _categoryEntity = CategoryEntity();

  var _editCategoryNameController = TextEditingController();

  List<Category> _categoryList = List<Category>();

  var category;

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  getAllCategory() async {
    var categories = await _categoryEntity.readCategory();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Category();
        categoryModel.name = category['name'];
        categoryModel.id = category['id'];
        _categoryList.add(categoryModel);
      });
    });
  }

  _editCategory(BuildContext context, categoryId) async {
    category = await _categoryEntity.readCategoryById(categoryId);
    setState(() {
      _editCategoryNameController.text = category[0]['name'] ?? 'No Name';
    });
    _editFormDialog(context);
  }

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                color: AppColors.primary,
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "キャンセル",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              FlatButton(
                color: AppColors.blue,
                onPressed: () async {
                  _category.name = _categoryNameController.text;

                  var result = await _categoryEntity.saveCategory(_category);
                  if (result > 0) {
                    print(result);
                    Navigator.pop(context);
                    getAllCategory();
                  }
                },
                child: Text(
                  "保存",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ],
            title: Text("カテゴリーを追加"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _categoryNameController,
                    decoration:
                        InputDecoration(hintText: "メモ", labelText: "カテゴリー名"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _editFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                color: AppColors.primary,
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "キャンセル",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              FlatButton(
                color: AppColors.blue,
                onPressed: () async {
                  _category.id = category[0]['id'];
                  _category.name = _editCategoryNameController.text;

                  var result = await _categoryEntity.updateCategory(_category);
                  if (result > 0) {
                    Navigator.pop(context);
                    getAllCategory();
                    _showSuccessSnackBar(Text('アップデートしました'));
                  }
                },
                child: Text(
                  "アップデート",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ],
            title: Text("カテゴリーを編集"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _editCategoryNameController,
                    decoration:
                        InputDecoration(hintText: "メモ", labelText: "カテゴリー名"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _deleteFormDialog(BuildContext context, categoryId) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                color: AppColors.primary,
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "キャンセル",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              FlatButton(
                color: AppColors.blue,
                onPressed: () async {
                  var result = await _categoryEntity.deleteCategory(categoryId);
                  if (result > 0) {
                    Navigator.pop(context);
                    getAllCategory();
                    _showSuccessSnackBar(Text('削除しました'));
                  }
                },
                child: Text(
                  "削除",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ],
            title: Text("カテゴリーを削除する"),
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
      key: _globalKey,
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
          "カテゴリー",
        ),
        backgroundColor: AppColors.blue,
      ),
      body: ListView.builder(
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 2.0, left: 16.0, right: 16.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editCategory(
                        context,
                        _categoryList[index].id,
                      );
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_categoryList[index].name),
                      IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            _deleteFormDialog(context, _categoryList[index].id);
                          })
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.playlist_add),
      ),
    );
  }
}
