// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
   bool obscureText ; 
   IconButton? iconButton;
     Function(String)? onChange;


   CustomTextField({required this.hintText, this.obscureText=false,this.iconButton,this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if(data!.isEmpty)
        {
          return 'Field is Required';
        }
        return null;
      },
      onChanged: onChange,
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 16
      ),
      decoration: InputDecoration(
        suffixIcon:iconButton ,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.w800),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.purple),
            borderRadius: BorderRadius.circular(25)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }
}
