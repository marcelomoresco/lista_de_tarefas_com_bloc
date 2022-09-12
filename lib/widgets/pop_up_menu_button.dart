import 'package:flutter/material.dart';

import '../models/task.dart';

class PopUpMenuButton extends StatelessWidget {
  final Task task;
  final VoidCallback delete;

  const PopUpMenuButton({
    Key? key,
    required this.task,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? ((context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text("Editar"),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                    label: Text("Favoritar"),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    label: Text("Deletar"),
                  ),
                  onTap: delete,
                )
              ])
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.restore),
                    label: Text("Restore"),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever),
                    label: Text("Deletar"),
                  ),
                  onTap: delete,
                )
              ],
    );
  }
}
