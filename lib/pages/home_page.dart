import 'package:flutter/material.dart';
import 'package:todo_app_with_bloc/pages/drawer_app.dart';

import '../blocs/bloc.export.dart';
import '../models/task.dart';
import '../widgets/add_task_view.dart';
import '../widgets/tasks_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: ((context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const addTaskView(),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          drawer: AppDrawer(),
          appBar: AppBar(
            title: const Text("Lista de Tarefas App"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text("Tarefa:"),
              ),
              TasksList(taskList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: "Add Tarefa",
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
