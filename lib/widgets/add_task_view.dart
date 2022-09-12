import 'package:flutter/material.dart';
import 'package:todo_app_with_bloc/service/guid_gen.dart';

import '../blocs/bloc.export.dart';
import '../models/task.dart';

class addTaskView extends StatelessWidget {
  const addTaskView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Adicione uma tarefa",
              style: TextStyle(
                fontSize: 24,
              )),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text("Tarefa"), border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
                label: Text("Descrição"), border: OutlineInputBorder()),
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
                  var task = Task(
                    title: titleController.text,
                    description: descriptionController.text,
                    id: GUIDGen.generate(), // GERA O ID - INTERNET
                    date: DateTime.now().toString(),
                  );
                  context.read<TasksBloc>().add(AddTask(task: task));

                  Navigator.pop(context);
                },
                child: const Text("Adicionar"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
