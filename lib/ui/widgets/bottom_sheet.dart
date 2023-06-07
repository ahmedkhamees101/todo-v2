import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/tasks_model.dart';
import 'package:todo/style/app_colors.dart';

class ShowModalBottomSheet extends StatefulWidget {

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
final formKey =  GlobalKey<FormState>();
DateTime selectDate=DateTime.now();
TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key:formKey ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Add new Task",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: MyColor.sheetTitle, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  controller: titleController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Title is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Task Title ",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Task Description ",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Select Date",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: MyColor.sheetTitle),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: (){
                   pickerDate(context);
              },
              child: Text(
                selectDate.toString().substring(0,10),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: (){
              if(
              formKey.currentState!.validate()){
              }
              var task = TaskModel(
                  title: titleController.text,
                  description: descriptionController.text,
                  status: false,
                  time: selectDate.millisecond);
              FirebaseFunction.addTaskToFireStore(task).then((value) => {
                Navigator.pop(context),
              });
            }, child: Text("Add Task",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
            ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15)
                  ,shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
                  backgroundColor: Colors.indigo
              ),
            )
          ],
        ),
      ),
    );
  }

   Future pickerDate(BuildContext context )async {
     DateTime? chosenDate = await showDatePicker(context: context,
         initialDate: DateTime.now(),
         firstDate: DateTime.now(),
         lastDate: DateTime.now().add(Duration(days: 365 * 5)));
     if (chosenDate != null) {
       selectDate = chosenDate;
       setState(() {

       });
     }
   }
}

