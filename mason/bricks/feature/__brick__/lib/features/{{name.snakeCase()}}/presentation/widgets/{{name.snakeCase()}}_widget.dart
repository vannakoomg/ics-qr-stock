import 'package:flutter/material.dart';

class {{name.pascalCase()}}Widget extends StatelessWidget {
  const {{name.pascalCase()}}Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('{{name.pascalCase()}} Widget'),),
      body: const Placeholder(),
    );
  }
}