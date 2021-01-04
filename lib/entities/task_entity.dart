import 'package:flutter_wishlist/models/repository/repository.dart';
import 'package:flutter_wishlist/models/task.dart';

class TaskEntity {
  Repository _repository;

  TaskEntity() {
    _repository = Repository();
  }

  saveTask(Task task) async {
    return await _repository.insertData('task', task.taskMap());
  }
}
