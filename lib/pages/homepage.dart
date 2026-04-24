import 'package:begin/data/database.dart';
import 'package:begin/util/dialogbox.dart';
import 'package:begin/util/todo_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  ToDoDataBase db = ToDoDataBase();
  //   control text
  final cntr = TextEditingController();

  @override
  void initState(){
    super.initState();
    db.loadData();
}

  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];

    });
    db.saveData();
  }
  void saveNewTask(){
    setState(() {
      db.toDoList.add([cntr.text, false]);
      cntr.clear();
    });
    db.saveData();
    Navigator.of(context).pop();
  }
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: cntr,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),

          );
        }
    );
  }
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "TO-DO",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight(700)
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.purple[900],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),

      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
