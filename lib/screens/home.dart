
import 'package:app/widgets/add_task_buttom.dart';
import 'package:app/widgets/displayed_task.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("To Do List"),
      ),
      floatingActionButton:const NewTask(),
      body:
            const Column(
              children: [
                Expanded(
                    flex: 2,
                    child: DisplayedTask(
                      
                    )),
              ],
            
        
        
      ),
    );
  }
}
