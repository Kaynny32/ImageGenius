import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_genius/models/color_gradient.dart';
import 'package:image_genius/models/project_data.dart';
import 'package:image_genius/pages/result_page.dart';
import 'package:image_genius/widgets/custom_button.dart';
import 'package:image_genius/widgets/custom_text_field.dart';

class PromtPage extends StatefulWidget {
  const PromtPage({super.key});

  @override
  State<PromtPage> createState() => _PromtPageState();
}

class _PromtPageState extends State<PromtPage> {

  final TextEditingController _controllerPromt = TextEditingController();
  bool _isButtonEnabled = false;

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _controllerPromt.text.trim().isNotEmpty;
    });
  }


  @override
  void initState() {
    super.initState();
    _controllerPromt.addListener(_updateButtonState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          // Фон с градиентом
          Container(
            decoration: BoxDecoration(
              gradient: Colorgradient.getByName('Forest'),
            ),
          ),

          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [     

                  CustomTextField(
                    width: 300,
                    height: 50, 
                    controller: _controllerPromt, 
                    lableText: 'Describe what you want to see…',
                  ),     

                  const SizedBox(height: 50,),

                  CustomButton(
                    isEnabled: _isButtonEnabled,
                    onPressed: (){
                      _generateImage();
                    },
                  ),

                ],
              ),
            ),
          )
        ],
      )
    );
  }
   void _generateImage() async {
    final prompt = _controllerPromt.text.trim();
    if (prompt.isEmpty) return;
    
    // Сохраняем промпт и генерируем изображение
    final projectData = context.read<ProjectData>();
    projectData.savePrompt(prompt);
    
    // Показываем loading при переходе
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(),
      ),
    );
    
    // Запускаем генерацию после перехода
    await projectData.generateImage();
  }

  @override
  void dispose() {
    _controllerPromt.removeListener(_updateButtonState);
    _controllerPromt.dispose();
    super.dispose();
  }
}