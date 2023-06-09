import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/tasks_model.dart';
import 'package:todo/style/app_colors.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseFunction.deleteTask(task.id);
            },
            icon: Icons.delete,
            label: "Delete",
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.edit,
            label: "Edit",
            backgroundColor: Colors.blue,
          ),
        ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 80,
                width: 3,
                decoration: BoxDecoration(
                    color: task.status ? MyColor.greenColor : MyColor.blueColor,
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                showDialog(
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
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: task.status
                            ? MyColor.greenColor
                            : MyColor.blueColor,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Text(task.description,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: task.status
                  ? Text(
                      "Done!",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: MyColor.greenColor,
                          ),
                    )
                  : InkWell(
                      onTap: () {
                        task.status = true;
                        FirebaseFunction.updateTask(task.id, task);
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height / 30,
                          width: MediaQuery.of(context).size.width * 0.14,
                          decoration: BoxDecoration(
                              color: MyColor.blueColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Image(
                              image: AssetImage("assets/images/icon.png"))),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
