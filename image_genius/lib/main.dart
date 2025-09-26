import 'package:flutter/material.dart';
import 'package:image_genius/models/project_data.dart';
import 'package:image_genius/pages/promt_page.dart';
import 'package:provider/provider.dart';
import 'package:image_genius/pages/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProjectData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AI Image Generator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: PromtPage(),
        routes: {
          '/prompt': (context) => PromtPage(),
          '/result': (context) => ResultPage(),
        },
      ),
    );
  }
}