import 'package:app/models/task_model.dart';
import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key, required this.selctask});
  final TaskModel selctask;

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = widget.selctask.task;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 50,
                ),
                const Center(
                  child: Text(
                    "Edit Task",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      widget.selctask.task = _controller.text;
                      widget.selctask.save();
                      _controller.clear();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 27,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: TextField(
                style: const TextStyle(fontSize: 25),
                maxLines: 5,
                controller: _controller,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
