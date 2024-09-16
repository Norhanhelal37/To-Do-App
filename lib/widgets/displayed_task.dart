import 'package:app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:app/cubits/add_task_cubit/add_task_state.dart';
import 'package:app/widgets/custome_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayedTask extends StatefulWidget {
  const DisplayedTask({
    super.key,
  });

  @override
  State<DisplayedTask> createState() => _DisplayedTaskState();
}

class _DisplayedTaskState extends State<DisplayedTask> {
  @override
  void initState() {
      AddTaskCubit.get(context).getalltasks();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(builder: (context, state) {
     

      return ListView.builder(
        shrinkWrap: true,
        itemCount: AddTaskCubit.alltasks.length,
        itemBuilder: (context, index) {
          return CustomeTask(
            mytask: AddTaskCubit.alltasks[index],
          );
        },
      );
    });
  }
}

