import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class StorageService {
  void uploadFile(
      XFile file, Function onProgress, Function onComplete, Function onError) {
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

  Future<String> generateThumbnailUrl(XFile file) async {
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: file.path,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      quality: 50,
    );
    final storageRef = FirebaseStorage.instance.ref().child('files').child('${file.name}-thumbnail');
    TaskSnapshot snapshot = await storageRef.putFile(File(thumbnailPath!));
    return await storageRef.getDownloadURL();
  }
}
