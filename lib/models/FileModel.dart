enum FileStatus {
  loaded,
  uploading,
}

class FileModel {
  FileStatus status;
  String url;
  String thumb;
  String type;
  double progress;

  FileModel({
    required this.status,
    required this.url,
    required this.thumb,
    required this.type,
    required this.progress,
  });
}
