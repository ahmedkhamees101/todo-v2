import 'package:flutter/material.dart';

typedef Validator= String? Function(String?);

class CustomTextField extends StatelessWidget {
   String labelText;
  TextInputType keyType;
  bool obscure;
  Widget icon;
  Validator validator;
   TextEditingController controller;


  CustomTextField({required this.labelText,
    this.keyType=TextInputType.text,this.obscure=false,
    this.icon=const Icon(Icons.email),required this.validator,required this.controller});

  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: controller,
      validator: validator,
        keyboardType: keyType,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: icon,
        ),
    );
  }
}
