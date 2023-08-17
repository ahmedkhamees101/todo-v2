import 'package:flutter/material.dart';
import 'package:todo/style/app_colors.dart';

class EditScreen extends StatefulWidget {
  static const String routeName = "editScreen";

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  DateTime selectDate = DateUtils.dateOnly(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: MyColor.mainBackGround,
      appBar: AppBar(
        title: Text(
          "ToDo App",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 15.0, top: 10,
        ),
        child: SingleChildScrollView(
          child: Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.white),
            ),
            color: Colors.white,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                      child: Text(
                    "Edit Task",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: MyColor.sheetTitle),
                  )),SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                     width: MediaQuery.sizeOf(context).width * 0.85,
                    child:  TextFormField(
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
                  ), ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        maxLines: 4,
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
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
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
                    onTap: () {
                      pickerDate(context);
                    },
                    child: Text(
                      selectDate.toString().substring(0, 10),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.2,
                  ),
                  ElevatedButton(
                    onPressed: () {},

                    //   onPressed: (){
                    //   if(
                    //   formKey.currentState!.validate()){
                    //
                    //   }
                    //   TaskModel task = TaskModel(
                    //       title: titleController.text,
                    //       description: descriptionController.text,
                    //       status: false,
                    //       time: selectDate.microsecondsSinceEpoch);
                    //   FirebaseFunction.addTaskToFireStore(task).then((value) => {
                    //     if(titleController.text.isNotEmpty&&descriptionController.text.isNotEmpty){
                    //       Navigator.pop(context),
                    //     }
                    //   });
                    // },
                    child: Text(
                      "Save Changes",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Colors.indigo),
                  )
                ],
              ),
            ),
          ),
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
      selectDate =DateUtils.dateOnly( chosenDate);
      setState(() {

      });
    }
  }
}
