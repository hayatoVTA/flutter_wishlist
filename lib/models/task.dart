class Task {
  int id;
  String title;
  String category;
  String taskDate;
  int isFinished;

  taskMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['category'] = category;
    mapping['taskDate'] = taskDate;
    mapping['isFinished'] = isFinished;

    return mapping;
  }
}
