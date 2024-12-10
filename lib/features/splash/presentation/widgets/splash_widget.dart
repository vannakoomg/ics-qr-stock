import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Splash Widget'),),
      body: const Placeholder(),
    );
  }
}