import 'package:flutter/material.dart';
import 'package:image_genius/widgets/custom_button.dart';


class SomethingIsWrong extends StatefulWidget {
  const SomethingIsWrong({super.key});

  @override
  State<SomethingIsWrong> createState() => _SomethingIsWrongState();
}

class _SomethingIsWrongState extends State<SomethingIsWrong> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_not_supported, size: 64, color: Colors.white),
          SizedBox(height: 20),
          Text(
            'No image generated',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10),
          CustomButton(
            colorButton: Colors.amber.shade500,
            isEnabled: true, 
            onPressed: (){Navigator.pop(context);}, 
            textButton: 'Go Back', 
            width: 150, 
            height: 50
          ),
        ],
      ),
    );
  }
}