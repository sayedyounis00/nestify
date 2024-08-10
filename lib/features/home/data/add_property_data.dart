import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Variables {
  static XFile? selectedImage;
  static String? imageUrl;
}

class UploadImageToFirebase {
  void uploadImage() async {
    try {
      final storage =
          FirebaseStorage.instanceFor(bucket: 'gs://nestify-8f4b4.appspot.com');

      var refStorage =
          storage.ref().child('images/${Variables.selectedImage?.name}');

      var uploadTask = refStorage.putFile(File(Variables.selectedImage!.path));

      var snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();

      Variables.imageUrl = downloadUrl;
      log(Variables.imageUrl!);
    } catch (e) {
      log('Error uploading image: $e');
    }
  }
}

class PickImageFromGallary {
  Future pickImage() async {
    var returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    Variables.selectedImage = XFile(returnedImage!.path);
    log('selected');
  }
}
