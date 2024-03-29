import 'package:flutter_wishlist/models/repository/repository.dart';
import 'package:flutter_wishlist/models/task.dart';

class TaskEntity {
  Repository _repository;

  TaskEntity() {
    _repository = Repository();
  }

  // Create task
  saveTask(Task task) async {
    return await _repository.insertData('task', task.taskMap());
  }

  // Read task
  readTask() async {
    return await _repository.readData('task');
  }

  // Delete data from table
  deleteTask(categoryId) async {
    return await _repository.deleteData('task', categoryId);
  }

  // // Read task by category
  // readTaskByChoiceCategory(category) async {
  //   return await _repository.readDataByChoiceColumnName(
  //       'task', 'category', category);
  // }
}
