// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

String formatToKhmer(String number) {
  // Khmer numbers from 0 to 9
  List<String> khmerDigits = ['០', '១', '២', '៣', '៤', '៥', '៦', '៧', '៨', '៩'];

  String result = '';
  String numberStr = number.toString();
  for (int i = 0; i < numberStr.length; i++) {
    int digit = int.parse(numberStr[i]);
    result += khmerDigits[digit];
  }

  return result;
}

final ImagePicker picker = ImagePicker();
bool checkStringIsgmail({required String value}) {
  return RegExp(r'^[a-zA-Z0-9.]+@gmail\.com$').hasMatch(value);
}

Future unFocus() async {
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<String> imageToBase64(File? imageFile) async {
  if (imageFile == null) {
    return '';
  } else {
    String? fileExtension = imageFile.path.split('.').last;
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return "data:image/$fileExtension;base64,$base64Image";
  }
}

Future<List> pickMultiImage() async {
  var listimage = await picker.pickMultiImage();
  return listimage;
}

Future<File> cropImage(File file) async {
  final newFile = await ImageCropper().cropImage(
    sourcePath: file.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.original,
    ],
    androidUiSettings: const AndroidUiSettings(
      toolbarTitle: 'Cropper',
      toolbarColor: Colors.blue,
      toolbarWidgetColor: Colors.white,
      initAspectRatio: CropAspectRatioPreset.original, // Default to original
      lockAspectRatio: false,
    ),
    iosUiSettings: const IOSUiSettings(
      minimumAspectRatio: 1.0,
    ),
  );
  return newFile!;
}

String cleanText(String input) {
  return input
      .split('\n') // Split the input string into lines
      .where((line) =>
          line.trim().isNotEmpty ||
          line.isEmpty) // Keep empty and non-empty lines
      .fold<List<String>>([], (result, line) {
    if (line.isNotEmpty || (result.isNotEmpty && result.last.isNotEmpty)) {
      result.add(line);
    }
    return result;
  }).join('\n'); // Join the cleaned lines with newlines
}

Future<File> pickImage({ImageSource source = ImageSource.gallery}) async {
  final picker = ImagePicker();
  var image = await picker.pickImage(source: source);

  if (image == null) {
    throw Exception('No image selected');
  }
  File originalImageFile = File(image.path);
  int originalImageSizeBytes = await originalImageFile.length();
  const int sizeLimitBytes = 200 * 1024;
  if (originalImageSizeBytes > sizeLimitBytes) {
    int quality = (sizeLimitBytes / originalImageSizeBytes * 100).round();
    quality = quality < 1 ? 1 : quality; // Ensure quality is at least 1
    final dir = await getTemporaryDirectory();
    final targetPath =
        path.join(dir.absolute.path, 'compressed_${path.basename(image.path)}');
    var compressedImage = await FlutterImageCompress.compressAndGetFile(
      image.path,
      targetPath,
      quality: quality,
    );
    if (compressedImage == null) {
      throw Exception('Image compression failed');
    }
    int compressedImageSizeBytes = await compressedImage.length();
    debugPrint(
        "Original Image Size: ${(originalImageSizeBytes / 1024).toStringAsFixed(2)} KB");
    debugPrint(
        "Compressed Image Size: ${(compressedImageSizeBytes / 1024).toStringAsFixed(2)} KB");
    return File(compressedImage.path);
  } else {
    debugPrint(
        "Original not compress : ${(originalImageSizeBytes / 1024).toStringAsFixed(2)} KB");
    return originalImageFile;
  }
}



extension RangeCheck on int {
  bool isBetween(int min, int max) => this > min && this < max;
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 100,
      right: 20,
      left: 20,
    ),
  ));
}

Color rendomColors() {
  int i = Random().nextInt(4) + 1;
  if (i == 1) {
    return const Color.fromARGB(255, 202, 88, 1);
  } else if (i == 2) {
    return const Color.fromARGB(255, 10, 104, 152);
  } else if (i == 3) {
    return const Color.fromARGB(255, 186, 7, 7);
  } else {
    return const Color.fromARGB(255, 29, 161, 82);
  }
}
