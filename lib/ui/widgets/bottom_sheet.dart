import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/style/app_colors.dart';

class ShowModalBottomSheet extends StatefulWidget {

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
final formKey =  GlobalKey<FormState>();

  Widget build(BuildContext context) {
      TextEditingController titleController = TextEditingController();
      TextEditingController descriptionController = TextEditingController();
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
                "12/12/12",
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
                print("route");

              }
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

   pickerDate(BuildContext context ){
    return showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365*5)));
  }
}
