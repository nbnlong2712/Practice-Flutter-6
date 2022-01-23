import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_todoey/model/task.dart';
import 'package:flutter_todoey/model/task_data.dart';
import 'package:flutter_todoey/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

import '../task_list.dart';

// ignore: must_be_immutable
class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  static const String router = "/task-screen";

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 30),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    color: Colors.green,
                    size: 45,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Todoey",
                      style: TextStyle(
                          fontSize: 37,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      //Cách xác định giữa các Provider khác nhau là dựa vào <TaskData> hay kiểu dữ liệu truyền vào, nếu ko sẽ ko biết provider của context nào là context nào
                      "${Provider.of<TaskData>(context).tasks.length} items",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white),
                child: Container(
                  margin: const EdgeInsets.only(top: 8, left: 15, right: 15),
                  child: TaskList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen(
                taskContentController: taskController,
                taskCallBack: () {
                  Provider.of<TaskData>(context, listen: false).add(
                        Task(
                          title: taskController.text,
                          isCheck: false,
                        ),
                      );
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
