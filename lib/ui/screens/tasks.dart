import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/style/app_colors.dart';

class Tasks extends StatefulWidget {
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
late DateTime selectDate;

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
        ],
    );
  }
}
