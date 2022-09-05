

import 'package:flutter/material.dart';
import 'package:to_do/ui/widgets/tasks_list.dart';



Widget bodyWidget(int taskCount) {


  if (taskCount == 0) {
     return Center(
         child: Text(
         " You don't have tasks yet ",
         style: TextStyle(fontSize: 24, color: Colors.grey),),);
   } else {
    return TasksList();
  }
}
