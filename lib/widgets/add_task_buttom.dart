import 'package:app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:app/cubits/task_cubit/task_cubit.dart';
import 'package:app/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.note_alt_rounded,
            color: Colors.black,
            size: 27,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    return AlertDialog.adaptive(
                      content: TextField(
                        controller: _controller,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(hintText: "new task"),
                      ),
                      actions: [
                        ElevatedButton.icon(
                            icon: const Icon(
                              Icons.save_as,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              TaskModel mytask = TaskModel(
                                  task: _controller.text, done: false);
                              TaskCubit.get(context).addtask(mytask);
                              AddTaskCubit.get(context).getalltasks();
                              _controller.clear();

                              Navigator.of(context).pop();
                            },
                            label: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            )),
                        ElevatedButton.icon(
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            label: const Text(
                              "Cancle",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    );
                  },
                );
              },
            );
          },
          label: const Text(
            "Add Task",
            style: TextStyle(color: Colors.black),
          )),
    );
  }
}
