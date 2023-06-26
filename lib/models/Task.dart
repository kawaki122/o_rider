
class Task {
  String id;
  String brandName;
  String brandLogo;
  String address;
  List<String> files;
  num? long;
  num? lat;
  num rating;

  Task({
    required this.id,
    required this.brandName,
    required this.brandLogo,
    required this.address,
    required this.files,
    this.long,
    this.lat,
    required this.rating,
  });
}