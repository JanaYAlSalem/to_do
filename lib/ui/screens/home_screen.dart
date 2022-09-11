import 'package:flutter/material.dart';
import 'package:to_do/ui/widgets/tasks_list.dart';
import '/ui/screens/task_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/bloc/states.dart';
import 'package:to_do/bloc/cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TaskCubit()..createDatabase(),
      // BlocConsumer : listener to change
      child: BlocConsumer<TaskCubit, TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xFF6666FF),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xFF6666FF),
                child: Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) {
                      final cubit = BlocProvider.of<TaskCubit>(context);
                      return BlocProvider.value(
                          value: cubit,
                          child: SingleChildScrollView(
                              child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: NewTaskScreen(),
                          )));
                    },
                  );
                }),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.list,
                          size: 30.0,
                          color: Color(0xFF6666FF),
                        ),
                        backgroundColor: Colors.white,
                        radius: 30.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Todoey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${TaskCubit.get(context).taskCount} Tasks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: TasksList()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
