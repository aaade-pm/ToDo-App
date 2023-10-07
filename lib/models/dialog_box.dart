import 'package:flutter/material.dart';
import 'package:todo_app/models/buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final TextEditingController? controller;
  final TextEditingController? controller2;

  VoidCallback addTask;
  VoidCallback cancelTask;

  DialogBox({
    super.key,
    required this.controller,
    required this.controller2,
    required this.addTask,
    required this.cancelTask,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[200],
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'NEW TASK',
                labelStyle: TextStyle(
                  color: Colors.black54,
                ),
                hintText: 'ADD NEW TASK',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller2,
              decoration: const InputDecoration(
                labelText: 'DESCRIPTION',
                labelStyle: TextStyle(
                  color: Colors.black54,
                ),
                hintText: 'ENTER TASK DESCRIPTION HERE',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  onPressed: addTask,
                  buttonName: 'SAVE',
                  iconType: Icons.save_outlined,
                ),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  onPressed: cancelTask,
                  buttonName: 'CANCEL',
                  iconType: Icons.delete_outline,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
