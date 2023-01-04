import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  Utils._();

  /// Open image gallery and pick an image
  static Future<XFile?> pickImageFromGallery() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  static Future<XFile?> pickImageFromcamera() async {
    return await ImagePicker().pickImage(source: ImageSource.camera);
  }

  /// Pick Image From Gallery and return a File
  static Future<File?> cropSelectedImage(String filePath) async {
    return await ImageCropper().cropImage(
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      sourcePath: filePath,
      aspectRatio: const CropAspectRatio(ratioX: 9.0, ratioY: 16.0),
      iosUiSettings: const IOSUiSettings(
        title: 'Crop Image',
        aspectRatioLockEnabled: true,
        minimumAspectRatio: 1.0,
        aspectRatioPickerButtonHidden: true,
      ),
    );
  }

  static Future<File?> cropSelectedprofileImage(String filePath) async {
    return await ImageCropper().cropImage(
      cropStyle: CropStyle.circle,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      sourcePath: filePath,
      iosUiSettings: const IOSUiSettings(
        title: 'Crop Image',
        aspectRatioLockEnabled: false,
        minimumAspectRatio: 1.0,
        aspectRatioPickerButtonHidden: false,
      ),
    );
  }
}
