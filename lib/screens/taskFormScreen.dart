import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/taskProviders.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? task;
  const TaskFormScreen({super.key, this.task});

  @override
  State<TaskFormScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TaskFormScreen> {
  late TextEditingController _titleController;
  late TextEditingController _categoryController;
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _isEditing = true;
      _titleController = TextEditingController(text: widget.task!.title);
      _categoryController = TextEditingController(text: widget.task!.category);
    } else {
      _titleController = TextEditingController();
      _categoryController = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskProviders = Provider.of<Taskproviders>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? "Editar tarea" : "Agregar nueva tarea"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              spacing: 20.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: "Título"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, ingrese un título";
                      }
                      return null;
                    }),
                TextFormField(
                  controller: _categoryController,
                  decoration: InputDecoration(labelText: "Categoría"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, ingrese una categoría";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (_isEditing) {
                          taskProviders.editTask(widget.task!.id,
                              _titleController.text, _categoryController.text);
                        } else {
                          taskProviders.addTask(
                              _titleController.text, _categoryController.text);
                        }
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                        _isEditing ? "Guardar cambios" : "Añadir nueva tarea"))
              ],
            )),
      ),
    );
  }
}
