import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/tasks_model.dart';
import 'package:todo/style/app_colors.dart';
import 'package:todo/ui/widgets/task_item.dart';

class Tasks extends StatefulWidget {
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
late DateTime selectDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: MyColor.blueColor,
            selectedTextColor: Colors.black87,
            onDateChange: (date) {
              setState(() {
                selectDate = date;
              });
            },
          ),
           SizedBox(height: 25,),
           StreamBuilder(
             stream: FirebaseFunction.getTaskFromFireStore(selectDate),
              builder: (context, snapshot) {
               if(snapshot.connectionState==ConnectionState.waiting){
                 return Center(child: CircularProgressIndicator());
               }
                  if(snapshot.hasError){
                    return Text("SomeThing Went Wrong",style: Theme.of(context).textTheme.bodyMedium,);
                  }
               List<TaskModel> task=snapshot.data?.docs.map((e) =>e.data()).toList()??[];
                  if(task.isEmpty){
                    return Text("No Task Found",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20,color:MyColor.blueColor),);
                  }
                  return Expanded(
                    child: ListView.builder(itemBuilder: (context, index){
                      return TaskItem(task[index]);
                    },itemCount: task.length,),
                  );
           },
           ),


        ],
    );
  }
}
