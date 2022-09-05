import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool? isChecked;
  final String? taskTitle;
  final void Function(bool?)? checkboxCallback;
  final VoidCallback? longPressCallback;

  TaskTile(
      {this.isChecked,
        this.taskTitle,
        this.checkboxCallback,
        this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Color(0xFF6666FF),
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}