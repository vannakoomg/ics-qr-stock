import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Base64Image extends StatelessWidget {
  final String base64String;

  const Base64Image({Key? key, required this.base64String}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      // Decode Base64 to Uint8List
      Uint8List imageBytes = base64Decode(base64String);
      return Image.memory(
        imageBytes,
        fit: BoxFit.cover, // Adjust the fit based on your design
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, color: Colors.red);
        },
      );
    } catch (e) {
      // Handle decoding errors
      return const Center(
        child: Text(
          "Invalid image",
          style: TextStyle(color: Colors.red),
        ),
      );
    }
  }
}
