import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/style/app_colors.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var items = ["Arabic","English"];
  String initValue = "Arabic";
  var List = ["Light","Dark"];
  String firtValue = "Light";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.mainBackGround,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Padding(
             padding: const EdgeInsets.only(top: 30,bottom: 15,left: 20),
             child: Text("Language",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
               color: Colors.black,fontSize: 14
             ),),
           ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: DropdownButton(
              value: initValue,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff5D9CEC),
              ),
              borderRadius: BorderRadius.circular(10),
              onChanged: (String? value){
                initValue = value!;
                setState(() {});
              },
                icon:Icon( Icons.arrow_drop_down,color: Color(0xff5D9CEC),
                ),

                items: items.map((String value){
                    return DropdownMenuItem(
                        value:  value,
                        child: Text (value)
                    );
                }).toList(),
            ),
          ),Padding(
             padding: const EdgeInsets.only(top: 30,bottom: 15,left: 20),
             child: Text("Theme",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
               color: Colors.black,fontSize: 14
             ),),
           ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: DropdownButton(
              value: firtValue,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff5D9CEC),
              ),
              borderRadius: BorderRadius.circular(10),
              onChanged: (String? value){
                firtValue = value!;
                setState(() {});
              },
                icon:Icon( Icons.arrow_drop_down,color: Color(0xff5D9CEC),
                ),

                items: List.map((String value){
                    return DropdownMenuItem(
                        value:  value,
                        child: Text (value)
                    );
                }).toList(),
            ),
          ),
        ],
      ),

    );
  }
}
