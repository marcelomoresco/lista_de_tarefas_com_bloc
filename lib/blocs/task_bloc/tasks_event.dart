// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;

  // ignore: prefer_const_constructors_in_immutables
  AddTask({
    required this.task,
  });

  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;
  UpdateTask({
    required this.task,
  });

  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;
  DeleteTask({
    required this.task,
  });

  List<Object> get props => [task];
}

class FavoriteTask extends TasksEvent {
  final Task task;

  FavoriteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class EditedTask extends TasksEvent {
  final Task oldTask;
  final Task newTask;
  EditedTask({
    required this.oldTask,
    required this.newTask,
  });
  @override
  List<Object> get props => [oldTask, newTask];
}
