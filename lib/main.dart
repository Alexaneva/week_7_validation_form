import 'package:flutter/material.dart';
import 'package:week_7_validation_form/screens/my_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyForm(),
      ),
    );
  }
}
