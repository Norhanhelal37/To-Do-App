import 'package:app/cubits/add_task_cubit/add_task_state.dart';
import 'package:app/models/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(TaskSaved());

  static AddTaskCubit get(context) => BlocProvider.of(context);

  Box<TaskModel> addbox = Hive.box("mytasks");

  static late List<TaskModel> alltasks;

  void getalltasks() {
    final tasks = addbox.values.toList().reversed ;
    alltasks =tasks.toList();
    emit(TaskSaved());
  }
}
