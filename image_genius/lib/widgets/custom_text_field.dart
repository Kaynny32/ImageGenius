import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final String lableText;

  const CustomTextField(
    {
      super.key,
      required this.width,
      required this.height,
      required this.controller,
      required this.lableText,
    }
  );

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.lableText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white, width: 1.5),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey, width: 1.5),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white, width: 1.5),
          ),

          labelStyle: TextStyle(color: Colors.white),
        ),                    
      ),
    );
  }
}