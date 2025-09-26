import 'package:flutter/material.dart';
import 'package:image_genius/models/project_data.dart';
import 'package:image_genius/widgets/error_widget_result.dart';
import 'package:image_genius/widgets/image_generation_widget.dart';
import 'package:image_genius/widgets/something%20_is_wrong.dart';
import 'package:image_genius/widgets/successful_widget_result.dart';
import 'package:provider/provider.dart';
import 'package:image_genius/models/color_gradient.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final projectData = Provider.of<ProjectData>(context, listen: false);
      if (projectData.prompt.isNotEmpty && projectData.generatedImageUrl == null) {
        projectData.generateImage(); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<ProjectData>(
        builder: (context, projectData, child) {
          return Stack(
            children: [
              Container(          
                decoration: BoxDecoration(
                  gradient: Colorgradient.getByName('Forest'),
                ),
              ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: _buildContent(projectData),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(ProjectData projectData) {
    if (projectData.isGenerating) {
      return ImageGenerationWidget(projectData: projectData,);
    }

    if (projectData.error != null) {
      return ErrorWidgetResult(projectData: projectData);
    }

    if (projectData.generatedImageUrl != null) {
      return SuccessfulWidgetResult(projectData: projectData,);
    }
    return SomethingIsWrong();
  }
}