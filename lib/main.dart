import 'package:flutter/material.dart';
import 'package:noteapp/dio.dart';

import 'signUp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My first app in PHP",
      home: SignUpScreen(),
    );
  }
}

