import 'package:flutter/material.dart';
import 'package:flutter_todoey/model/task_data.dart';
import 'package:provider/provider.dart';


class TaskTile extends StatelessWidget {
  TaskTile({Key? key,
    required this.title,
    required this.isCheck,
    required this.callBack,
    required this.onLongPress
  }) : super(key: key);

  final String title;
  bool isCheck = false;
  void Function(bool?)? callBack;
  void Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, tasks, Widget? child)
      {
        return ListTile(
          onLongPress: onLongPress,
          title: Text(
            title,
            style: TextStyle(
              decoration: isCheck ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            activeColor: Colors.green,
            value: isCheck,
            onChanged: callBack,
          ),
        );
      },
    );
  }
}