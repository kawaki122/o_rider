import 'package:cloud_firestore/cloud_firestore.dart';

class FileRaw {
    final String? file;
  final String? thumb;
  final String? type;

  FileRaw({
    this.file,
    this.thumb,
    this.type,
  });

  factory FileRaw.fromFirestore(
    Map<String, dynamic> data,
    SnapshotOptions? options,
  ) {
    return FileRaw(
      file: data['file'],
      thumb: data['thumb'],
      type: data['type'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (file != null) "file": file,
      if (thumb != null) "thumb": thumb,
      if (type != null) "type": type,
    };
  }
}