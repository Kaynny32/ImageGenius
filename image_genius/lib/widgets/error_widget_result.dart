import 'package:flutter/material.dart';
import 'package:image_genius/models/project_data.dart';
import 'package:image_genius/widgets/custom_button.dart';

class ErrorWidgetResult extends StatefulWidget {
  final ProjectData projectData;
  
  const ErrorWidgetResult(
    {
      super.key,
      required this.projectData,
    }
  );

  @override
  State<ErrorWidgetResult> createState() => _ErrorWidgetResultState();
}

class _ErrorWidgetResultState extends State<ErrorWidgetResult> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'Generation Failed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.projectData.error!,
                style: TextStyle(color: Colors.white70, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              CustomButton(
                colorButton: Colors.amber.shade500,
                width: 200,
                height: 50,
                isEnabled: true, 
                textButton: 'Retry Generation',
                onPressed: (){
                  widget.projectData.retryGeneration();
                }
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Try Different Prompt',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
  }
}