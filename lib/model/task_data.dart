import 'package:flutter/cupertino.dart';
import 'package:flutter_todoey/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(title: 'haha1', isCheck: false),
    Task(title: 'haha2', isCheck: false),
  ];

  void add(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void toggleCheck(Task task)
  {
    task.toggleCheck();
    notifyListeners();
  }

  void deleteTask(index)
  {
    tasks.remove(tasks[index]);
    notifyListeners();
  }
}
