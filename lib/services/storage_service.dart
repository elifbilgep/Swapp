import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  var _storage = FirebaseStorage.instance.ref(); //depolama referansı
  String pictureId;

  uploadSwapiePhoto(File photoFile) async {
    pictureId = Uuid().v4();
    UploadTask uploadManager = _storage
        .child("pictures/swappies/swappie_$pictureId.jpg")
        .putFile(photoFile);
    TaskSnapshot snapshot = await uploadManager;
    String uploadedPhotoUrl = await snapshot.ref.getDownloadURL();
    return uploadedPhotoUrl;
  }
}
