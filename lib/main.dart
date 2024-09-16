import 'package:app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:app/cubits/task_cubit/task_cubit.dart';
import 'package:app/models/task_model.dart';
import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('mytasks');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit(),),
        BlocProvider(create: (context) => AddTaskCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: const TextTheme(
                bodyMedium: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            elevatedButtonTheme: const ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red))),
            appBarTheme: const AppBarTheme(
                color: Colors.black,
                centerTitle: true,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold))),
        home: const HomeScreen(),
      ),
    );
  }
}
