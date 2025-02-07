import 'package:flutter/material.dart';
import 'package:todolist/providers/taskProviders.dart';
import 'package:todolist/widgets/filterButton.dart';

class ButtonsList extends StatelessWidget {
  final Taskproviders taskProvider;
  const ButtonsList({super.key, required this.taskProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          spacing: 10.0,
          children: [
            Expanded(
              child: Filterbutton(
                  label: "Todos",
                  isSelected: taskProvider.filter == FilterTask.all,
                  onPressed: () => taskProvider.setFilter(FilterTask.all)),
            ),
            Expanded(
              child: Filterbutton(
                  label: "Pendientes",
                  isSelected: taskProvider.filter == FilterTask.pending,
                  onPressed: () => taskProvider.setFilter(FilterTask.pending)),
            ),
            Expanded(
              child: Filterbutton(
                  label: "Completadas",
                  isSelected: taskProvider.filter == FilterTask.completed,
                  onPressed: () =>
                      taskProvider.setFilter(FilterTask.completed)),
            )
          ],
        ));
  }
}
