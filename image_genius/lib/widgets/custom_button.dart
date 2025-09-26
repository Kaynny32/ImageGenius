import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final bool isEnabled;
  final VoidCallback onPressed;
  
  const CustomButton(
    {
      super.key,
      required this.isEnabled,
      required this.onPressed,
    }
  );

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 40,
      child: ElevatedButton(
        onPressed: widget.isEnabled ? (){
          widget.onPressed();
        }:null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.isEnabled ?Colors.amber.shade500 : Colors.grey),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.grey, width: 1
              ),
            )
          )
        ),
        child: Text('Generate', 
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
  }
}