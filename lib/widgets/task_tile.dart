import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_with_bloc/widgets/pop_up_menu_button.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.star),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy hh:mm').format(
                          DateTime.parse(task.date),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        context.read<TasksBloc>().add(UpdateTask(task: task));
                      }
                    : null,
              ),
              PopUpMenuButton(
                task: task,
                delete: () =>
                    context.read<TasksBloc>().add(DeleteTask(task: task)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
