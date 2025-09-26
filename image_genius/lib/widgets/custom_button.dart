import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final bool isEnabled;
  final VoidCallback onPressed;
  final String textButton;
  final double width;
  final double height;
  final Color colorButton;
  final double minFontSize;
  final double maxFontSize; 
  
  const CustomButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
    required this.textButton,
    required this.width,
    required this.height,
    required this.colorButton,
    this.minFontSize = 10,
    this.maxFontSize = 18,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double _calculateFontSize(String text, double maxWidth, double maxHeight) {

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: widget.maxFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    
    textPainter.layout(maxWidth: maxWidth);

    if (textPainter.width <= maxWidth * 0.9 && textPainter.height <= maxHeight * 0.7) {
      return widget.maxFontSize;
    }

    double fontSize = widget.maxFontSize;
    while (fontSize > widget.minFontSize) {
      textPainter.text = TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      );
      textPainter.layout(maxWidth: maxWidth);
      
      if (textPainter.width <= maxWidth * 0.9 && textPainter.height <= maxHeight * 0.7) {
        return fontSize;
      }
      fontSize -= 1;
    }
    
    return widget.minFontSize;
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = _calculateFontSize(widget.textButton, widget.width, widget.height);
    
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.isEnabled ? widget.onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            widget.isEnabled ? widget.colorButton : Colors.grey
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.grey, width: 1),
            )
          ),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 8)),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            widget.textButton, 
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      )
    );
  }
}