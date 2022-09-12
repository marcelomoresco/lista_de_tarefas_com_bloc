import 'package:flutter/material.dart';

import '../blocs/bloc.export.dart';
import '../models/task.dart';

class Task_Tile extends StatelessWidget {
  const Task_Tile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: task.isDone,
          onChanged: task.isDeleted == false
              ? (value) {
                  context.read<TasksBloc>().add(UpdateTask(task: task));
                }
              : null),
      onLongPress: () => context.read<TasksBloc>().add(DeleteTask(task: task)),
    );
  }
}
