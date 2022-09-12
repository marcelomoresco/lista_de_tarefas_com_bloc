// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/task.dart';

class PopUpMenuButton extends StatelessWidget {
  final Task task;
  final VoidCallback delete;
  final VoidCallback editTaskCallback;

  const PopUpMenuButton({
    Key? key,
    required this.task,
    required this.delete,
    required this.editTaskCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: ((context) => [
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: editTaskCallback,
                  icon: Icon(Icons.edit),
                  label: Text("Editar"),
                ),
              ),
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: delete,
                  icon: Icon(Icons.delete),
                  label: Text("Deletar"),
                ),
              )
            ]));
  }
}
