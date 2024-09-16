import 'package:app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:app/cubits/task_cubit/task_cubit.dart';
import 'package:app/models/task_model.dart';
import 'package:app/screens/edit_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeTask extends StatelessWidget {
  const CustomeTask({
    super.key,
    required this.mytask,
  });
  final TaskModel mytask;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return ListTile(
          title: Text(
            mytask.task,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: (mytask.done) ? Colors.grey : Colors.black,
                decoration: (mytask.done)
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>  EditTask(
                selctask: mytask,
              ),
            ));
          },
          leading: Checkbox(
            activeColor: Colors.grey,
            value: mytask.done,
            onChanged: (val) {
              mytask.done = val!;
              mytask.save();
              AddTaskCubit.get(context).getalltasks();
            },
          ),
          trailing: IconButton(
              onPressed: () {
                mytask.delete();

                AddTaskCubit.get(context).getalltasks();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 25,
              )),
        );
      },
    );
  }
}
