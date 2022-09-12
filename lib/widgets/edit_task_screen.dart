import 'package:flutter/material.dart';
import 'package:todo_app_with_bloc/service/guid_gen.dart';

import '../blocs/bloc.export.dart';
import '../models/task.dart';

class EditTaskView extends StatelessWidget {
  final Task oldTask;
  const EditTaskView({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: oldTask.title);
    final descriptionController =
        TextEditingController(text: oldTask.description);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.deepPurple),
      child: Column(
        children: [
          const Text("Edite uma tarefa",
              style: TextStyle(fontSize: 24, color: Colors.white)),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(17)),
            child: TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: "Tarefa",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(17)),
            child: TextField(
              autofocus: true,
              controller: descriptionController,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                  hintText: "Descrição",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar"),
              ),
              ElevatedButton(
                onPressed: () {
                  var editedTask = Task(
                    title: titleController.text,
                    description: descriptionController.text,
                    id: oldTask.id,
                    isFavorite: oldTask.isFavorite,
                    isDone: false,
                    date: DateTime.now().toString(),
                  );
                  context.read<TasksBloc>().add(EditedTask(
                        oldTask: oldTask,
                        newTask: editedTask,
                      ));

                  Navigator.pop(context);
                },
                child: const Text(
                  "Salvar",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
