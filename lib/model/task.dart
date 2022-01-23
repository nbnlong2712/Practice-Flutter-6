class Task{
  late String title;
  late bool isCheck;

  Task({required this.title, required this.isCheck});

  void toggleCheck()
  {
    isCheck = !isCheck;
  }
}