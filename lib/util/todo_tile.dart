import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final bool? taskCompleted;
  final void Function(bool?)? onChanged;
  final String taskName;
  final Function(BuildContext)? deleteTask;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(onPressed: deleteTask,
                icon: Icons.delete,
                backgroundColor: Colors.red,
              ),
            ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.indigo
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Checkbox(value: taskCompleted, onChanged: onChanged,
                ),
                Text(taskName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
