import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  void uploadFile(XFile file, Function onProgress, Function onComplete, Function onError) {
    final filePath = file.path;
    final storageRef = FirebaseStorage.instance.ref().child('files');
print(filePath);
    final uploadTask = storageRef.child(file.name).putFile(File(filePath));
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      if (taskSnapshot.state == TaskState.running) {
        print("Upload in progress.");
        final progress =
            (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            onProgress(progress);
      } else if (taskSnapshot.state == TaskState.success) {
        print("Uploaded successfully!");
        onComplete(await storageRef.child(file.name).getDownloadURL());
      } else if (taskSnapshot.state == TaskState.error) {
        onError();
        print("Error uploading");
      }
    });
  }
}
