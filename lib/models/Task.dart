
class Task {
  String id;
  String brand;
  String address;
  List<String> files;
  num? long;
  num? lat;

  Task({
    required this.id,
    required this.brand,
    required this.address,
    required this.files,
    this.long,
    this.lat,
  });
}