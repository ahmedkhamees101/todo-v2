 import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/tasks_model.dart';

import '../../style/app_colors.dart';

 class ShowDialogDetail {
TaskModel task;
ShowDialogDetail(this.task);
  static Future<dynamic>alert(BuildContext context,TaskModel task){
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Center(
                child: Text(
                  task.title,
                  style: TextStyle(
                      color: task.status
                          ? MyColor.greenColor
                          : MyColor.blueColor),
                )),
            content: Text(
              task.description,
              style: TextStyle(
                color: CupertinoColors.inactiveGray,
              ),
            ));
      },
    );
   }
}
