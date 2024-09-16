// import 'package:flutter_bloc/flutter_bloc.dart';

part of 'task_cubit.dart';

abstract class TaskState {}

class InitialState extends TaskState {}


class AddTask extends TaskState {}

class TaskRemoved extends TaskState {}

class Taskchange extends TaskState{}
