import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen(
      {Key? key,
      required this.taskContentController,
      required this.taskCallBack})
      : super(key: key);

  TextEditingController taskContentController;
  Function() taskCallBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Expanded(
                flex: 1,
                child: Text(
                  "ADD TASK",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Enter note content",
                      hintStyle: TextStyle(color: Colors.grey)),
                  controller: taskContentController,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.green,
                    onPressed: taskCallBack,
                    label: Text("Create task"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
