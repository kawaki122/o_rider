enum FileStatus {
  loaded,
  uploading,
}

class FileModel {
  FileStatus status;
  String url;
  double progress;

  FileModel({required this.status, required this.url, required this.progress});
}
