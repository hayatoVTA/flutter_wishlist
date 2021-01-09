// import 'package:flutter_wishlist/models/category.dart';
// import 'package:flutter_wishlist/models/repository/repository.dart';
//
// class CategoryEntity {
//   Repository _repository;
//
//   CategoryEntity() {
//     _repository = Repository();
//   }
//
//   // Creating and Save data
//   saveCategory(Category category) async {
//     return await _repository.insertData('categories', category.categoryMap());
//   }
//
//   // Read data from category
//   readCategory() async {
//     return await _repository.readData('categories');
//   }
//
//   // Read data from table by id
//   readCategoryById(categoryId) async {
//     return await _repository.readDataById('categories', categoryId);
//   }
//
//   // Update data from table
//   updateCategory(Category category) async {
//     return await _repository.updateData('categories', category.categoryMap());
//   }
//
//   // Delete data from table
//   deleteCategory(categoryId) async {
//     return await _repository.deleteData('categories', categoryId);
//   }
// }
