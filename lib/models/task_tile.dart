import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TaskTile extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? onPressedAction;

  TaskTile({
    super.key,
    required this.isCompleted,
    required this.onChanged,
    required this.taskDescription,
    required this.taskTitle,
    required this.onPressedAction,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: onPressedAction,
            icon: Icons.delete_outline,
            label: 'DELETE',
            backgroundColor: Colors.red,
            spacing: 0,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.purple[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              taskTitle,
              style: GoogleFonts.ptSerif(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.grey[300],
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
