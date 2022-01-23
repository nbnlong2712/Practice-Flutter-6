import 'package:flutter/material.dart';
import 'package:flutter_todoey/model/task.dart';
import 'package:flutter_todoey/model/task_data.dart';
import 'package:flutter_todoey/task_tile.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskList, Widget? child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return TaskTile(
              onLongPress:(){
                taskList.deleteTask(index);
              },
              title: taskList.tasks[index].title,
              isCheck: taskList.tasks[index].isCheck,
              callBack: (value) {
                taskList.toggleCheck(taskList.tasks[index]);
              },
            );
          },
          itemCount: taskList.tasks.length,
        );
      },
    );
  }
}
