import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/tasks_model.dart';
import 'package:todo/style/app_colors.dart';

class TaskItem extends StatelessWidget {
TaskModel task;
TaskItem(this.task);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(15)
         ),
          child: Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       height: 80,
                       width: 3,
                       decoration: BoxDecoration(
                         color: MyColor.blueColor,
                         borderRadius: BorderRadius.circular(25)
                       ),
                     ),
                   ),
                   SizedBox(width: 5,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        Text(task.title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColor.blueColor,fontSize: 18
                        ),),
                       SizedBox(height: 5,),
                       Container(
                         width:MediaQuery.of(context).size.width*0.60,
                         child: Text(task.description,
                              overflow:TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16)),
                       ),
                     ],
                   ),
                   Spacer(),
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Container(
                       height: MediaQuery.of(context).size.height/30,
                         width:MediaQuery.of(context).size.width*0.14,
                         decoration: BoxDecoration(
                           color: MyColor.blueColor,
                           borderRadius: BorderRadius.circular(25)
                         ),
                         child: InkWell(
                             onTap: (){

                             },
                             child: Image(image: AssetImage("assets/images/icon.png")))),
                   )
                 ],
          ),
        ),
      ),
    );
  }
}
