import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/core/constants/constants.dart';

class Base64Image extends StatefulWidget {
  final String base64String;
  final double? width;
  final double? height;

  const Base64Image({
    Key? key,
    required this.base64String,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _Base64ImageState createState() => _Base64ImageState();
}

class _Base64ImageState extends State<Base64Image> {
  late Uint8List _imageBytes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _decodeBase64Image();
  }

  void _decodeBase64Image() async {
    try {
      // Simulate a delay for loading image if required
      await Future.delayed(const Duration(milliseconds: 500)); // Optional delay
      _imageBytes = base64Decode(widget.base64String);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        padding: const EdgeInsets.all(kPadding2),
        child: const Center(
          child: MoonCircularLoader(
            color: AppColor.primaryColor,
          ), // Show loading indicator while image is decoding
        ),
      );
    }

    return Image.memory(
      _imageBytes,
      width: widget.width ?? double.infinity, // Default width if not provided
      height: widget.height ??
          MediaQuery.of(context).size.height /
              2.5, // Default height if not provided
      fit: BoxFit.cover, // Adjust the fit based on your design
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Icon(Icons.error, color: Colors.red),
        );
      },
    );
  }
}
