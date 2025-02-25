import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File?> customPickImage(BuildContext context) async {
  final permissionStatus = await Permission.camera.status;

  if (permissionStatus.isPermanentlyDenied) {
    
    return null;
  }

  if (!permissionStatus.isGranted) {
    if (!(await Permission.camera.request()).isGranted) {
      
      return null;
    }
  }
  final picker = ImagePicker();
  final pickedImage = await showDialog<ImageSource>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Select Image Source"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: const Text("Gallery"),
                onTap: () {
                  Navigator.of(context).pop(ImageSource.gallery);
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                child: const Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop(ImageSource.camera);
                },
              ),
            ],
          ),
        ),
      );
    },
  );

  if (pickedImage != null) {
    final pickedFile = await picker.pickImage(source: pickedImage);
    if (pickedFile != null) {
      if (pickedImage == ImageSource.camera) {
        return await customresizeImage(File(pickedFile.path));
      }
      return File(pickedFile.path);
    }
  }
  return null;
}

Future<File> customresizeImage(File pickedFile) async {
  final bytes = await pickedFile.readAsBytes();
  final image = img.decodeImage(Uint8List.fromList(bytes));

  if (image != null) {
    final resizedImage = img.copyResize(image,
        width: Get.width.toInt(), height: Get.height.toInt());
    final resizedFile = File(pickedFile.path)
      ..writeAsBytesSync(img.encodeJpg(resizedImage));
    return resizedFile;
  }
  throw Exception("Failed to resize image.");
}

////////////pick multiple images
Future<List<File>> custompickMultipleImages() async {
 
  final ImagePicker _picker = ImagePicker();
  List<File> resizedFiles = [];
  final List<XFile>? images = await _picker.pickMultiImage();

  if (images != null) {
    for (XFile image in images) {
      final File file = File(image.path);
      if (image.name.startsWith('IMG_')) {
        final bytes = await file.readAsBytes();
        final decodedImage = img.decodeImage(Uint8List.fromList(bytes));

        if (decodedImage != null) {
          final resizedImage = img.copyResize(
            decodedImage,
            width: Get.width.toInt(),
            height: Get.height.toInt(),
          );
          final resizedFile = File(image.path)
            ..writeAsBytesSync(img.encodeJpg(resizedImage));
          resizedFiles.add(resizedFile);
        } else {
          throw Exception("Failed to decode image.");
        }
      } else {
        resizedFiles.add(file);
      }
    }
  }

  return resizedFiles;
}
