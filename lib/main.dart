import 'package:flutter/material.dart';
import 'package:stepper_flutter/stepper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: const ColorScheme.light(primary: Colors.teal),
      ),
      debugShowCheckedModeBanner: false,
      home: const StepperUsage(),
    );
  }
}
