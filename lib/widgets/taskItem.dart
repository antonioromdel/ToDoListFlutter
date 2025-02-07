import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/taskProviders.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<Taskproviders>(context, listen: false);
    return Card(
      child: ListTile(
        title: Text(task.title,
            style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null)),
        subtitle: Text(task.category),
        trailing: Row(mainAxisSize: MainAxisSize.min, spacing: 10.0, children: [
          Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
                taskProvider.toggleChangeStatus(task.id);
              }),
          IconButton(
              onPressed: () => _confirmDelete(context, taskProvider, task.id),
              icon: Icon(Icons.delete))
        ]),
      ),
    );
  }
}

void _confirmDelete(
    BuildContext context, Taskproviders taskProvider, String taskId) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confimar eliminación"),
          content: Text("¿Seguro que deseas eliminar?"),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancelar")),
            TextButton(
                onPressed: () {
                  taskProvider.deleteTask(taskId);
                  Navigator.of(context).pop();
                },
                child: Text("Sí, eliminar"))
          ],
        );
      });
}
