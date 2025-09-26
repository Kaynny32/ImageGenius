import 'package:flutter/material.dart';
import 'package:image_genius/models/project_data.dart';

class ImageGenerationWidget extends StatefulWidget {
  final ProjectData projectData;

  const ImageGenerationWidget(
    {
      super.key,
      required this.projectData,
    }
  );

  @override
  State<ImageGenerationWidget> createState() => _ImageGenerationWidgetState();
}

class _ImageGenerationWidgetState extends State<ImageGenerationWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Generating your image...',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '${widget.projectData.prompt}',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
  }
}