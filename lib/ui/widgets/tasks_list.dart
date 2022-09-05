import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/bloc/states.dart';
import '/ui/widgets/task_tile.dart';
import 'package:to_do/bloc/cubit.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (TaskCubit.get(context).taskCount() == 0) {
          return Center(
            child: ListTile(title:
            Text(
              " You don't have tasks yet ",
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
            ),
          ) ;

        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              final task = TaskCubit.get(context).tasks[index];
              return TaskTile(
                taskTitle: task.name!,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  TaskCubit.get(context).updateTask(task);
                },
                longPressCallback: () {
                  TaskCubit.get(context).deleteTask(task);
                },
              );
            },
            itemCount: TaskCubit.get(context).taskCount(),
          );
        }
      },
    );
  }
}
