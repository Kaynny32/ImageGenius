import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_genius/models/project_data.dart';
import 'package:image_genius/widgets/custom_button.dart';

class SuccessfulWidgetResult extends StatefulWidget {
  final ProjectData projectData;
  
  const SuccessfulWidgetResult(
    {
      super.key,
      required this.projectData,
    }
  );

  @override
  State<SuccessfulWidgetResult> createState() => _SuccessfulWidgetResultState();
}

class _SuccessfulWidgetResultState extends State<SuccessfulWidgetResult> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [          
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              '${widget.projectData.prompt}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          
          SizedBox(height: 20),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage( 
                  imageUrl: widget.projectData.generatedImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) => Container(
                    color: Colors.black.withOpacity(0.2),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.black.withOpacity(0.2),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error, color: Colors.white, size: 48),
                          SizedBox(height: 10),
                          Text(
                            'Failed to load image',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: CustomButton(
                  colorButton: Colors.amber.shade500,
                  isEnabled: true, 
                  onPressed: (){widget.projectData.retryGeneration();}, 
                  textButton: 'Try Another', 
                  width: 150, 
                  height: 50),
              ),
              SizedBox(width: 16),
              Expanded(
                child:  CustomButton(
                  colorButton: Colors.green.shade500,
                  isEnabled: true, 
                  onPressed: (){Navigator.pop(context);}, 
                  textButton: 'New Prompt', 
                  width: 150, 
                  height: 50),
              ),
            ],
          ),
        ],
      );
  }
}