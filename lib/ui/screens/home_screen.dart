import 'package:flutter/material.dart';
import '/ui/screens/task_screen.dart';
import '/ui/widgets/tasks_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/bloc/states.dart';
import 'package:to_do/bloc/cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';


class HomeScreen extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TaskCubit(),
      // BlocConsumer : listener to change
      child: BlocConsumer<TaskCubit, TaskStates> (
        listener: (context,state) {},
        builder: (context,state) {
          return Scaffold(
            backgroundColor: Colors.lightBlueAccent,
            floatingActionButton:
            FloatingActionButton(
                backgroundColor: Colors.lightBlueAccent,
                child: Icon(Icons.add),
                onPressed: () {

                  // TaskCubit.get(context).addTask("newTaskTitle!");

                  // showModalBottomSheet(
                  //     context: context,
                  //     isScrollControlled: true,
                  //     builder: (context) => SingleChildScrollView(
                  //         child:Container(
                  //           // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  //           child: NewTaskScreen(),
                  //         )
                  //     )
                  // );


                  scaffoldKey.currentState?.showBottomSheet(
                          (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(
                      20.0,
                  ),
                  child: Form(
                  key: formKey,
                  child: NewTaskScreen(),
                          ),
                  ),
                  );

                }
            ),
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
                          color: Colors.lightBlueAccent,
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
                        '${TaskCubit.get(context).taskCount()} Tasks',
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
                    child: TasksList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

  }
}