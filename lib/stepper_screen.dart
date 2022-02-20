import 'package:flutter/material.dart';

class StepperScreen extends StatelessWidget {
  StepperScreen(this.ad, {Key? key}) : super(key: key);
  final ad;
  TextStyle style = const TextStyle(fontSize: 32);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'hoş Geldin',
              style: style,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              ad,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
