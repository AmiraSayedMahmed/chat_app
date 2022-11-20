

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({this.hintText,this.label , this.onChanged , this.obsecure = false}) ;
   Function(String)? onChanged;
String? hintText;
String? label;
bool? obsecure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure!,
style: TextStyle(color: Colors.white , fontSize: 20),
       validator: (data){
         if(data!.isEmpty){
           return 'This field is required';
         }
       },
      onChanged: onChanged,

      decoration:  InputDecoration(
        enabledBorder:  const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            )
        ),
        hintText: hintText,
        label: Text('$label'),
        labelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white
        ),
        hintStyle: const TextStyle(
          color: Colors.white70
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            )
        ),
      ),
    );
  }
}
