import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDoList = [];
//   refer v box
  final myBox = Hive.box("mybox");

  void saveData(){
    myBox.put("TODOLIST", toDoList);
  }
  void loadData(){
    toDoList = myBox.get("TODOLIST");
  }



}