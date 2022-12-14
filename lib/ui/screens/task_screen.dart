import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/bloc/cubit.dart';
import 'dart:developer';
import 'package:to_do/bloc/states.dart';
import 'package:hexcolor/hexcolor.dart';



class NewTaskScreen extends StatelessWidget {

  String? newTaskTitle;

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<TaskCubit, TaskStates>(
      listener: (context, state) {
        if (state is TaskAddState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Container(
          color: Color(0xff757575),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xFF6666FF),
                  ),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText) {

                    newTaskTitle = newText;

                    },
                ),
                FlatButton(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Color(0xFF6666FF),
                  onPressed: () {

                    log("Add is pressed: $newTaskTitle");

                    TaskCubit.get(context).addTask(newTaskTitle!);

                  },
                ),
              ],
            ),
          ),
        );
        },
    );
  }
}
