import 'package:app/models/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(InitialState());

  static TaskCubit get(context) => BlocProvider.of(context);

  void addtask(TaskModel newtask) async {
    Box<TaskModel> addbox = Hive.box("mytasks");
    await addbox.add(newtask);
    emit(AddTask());
  }

  

}
