import 'package:flutter/material.dart';
import 'package:flutter_todoey/model/task_data.dart';
import 'package:flutter_todoey/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
          home: TaskScreen(),
          initialRoute: TaskScreen.router,
          routes: {
            TaskScreen.router: (context) => TaskScreen(),
          }),
    );
  }
}
