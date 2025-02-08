import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/taskProviders.dart';
import 'package:todolist/screens/taskFormScreen.dart';
import 'package:todolist/widgets/buttonsList.dart';
import 'package:todolist/widgets/taskItem.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<Taskproviders>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Lista de tareas",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ButtonsList(
            taskProvider: taskProvider,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: taskProvider.task.length,
                  itemBuilder: (context, index) {
                    final task = taskProvider.task[index];
                    return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskFormScreen(
                                      task: task,
                                    ))),
                        child: TaskItem(task: task));
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                TaskFormScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 0.1);
              const end = Offset.zero;
              const curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offSetAnimation = animation.drive(tween);
              return SlideTransition(
                  position: offSetAnimation, child: TaskFormScreen());
            },
          ));
        },
        label: Text("Añadir Tarea"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
    );
  }
}
