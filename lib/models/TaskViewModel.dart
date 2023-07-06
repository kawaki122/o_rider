import 'package:o_rider/models/FileModel.dart';
import 'package:o_rider/services/LocationService.dart';

class TaskViewModel {
  String id;
  String brandName;
  String brandLogo;
  String address;
  List<FileModel> files;
  num long;
  num lat;
  num rating;
  String status;
  bool locationLoading = false;
  bool locationAdded = false;
  bool submitting = false;

  void loadLocation(Function callback) {
    locationLoading = true;
    callback('loading_true');
    determinePosition().then((location) {
      long = location.longitude;
      lat = location.altitude;
      locationLoading = false;
      locationAdded = true;
      callback();
      Future.delayed(const Duration(seconds: 2)).then((val) {
        locationAdded = false;
        callback();
      });
    }).catchError((e) {
      print(e);
      locationLoading = false;
      callback('loading_false');
    });
  }

  TaskViewModel({
    required this.id,
    required this.brandName,
    required this.brandLogo,
    required this.address,
    required this.files,
    required this.long,
    required this.lat,
    required this.rating,
    required this.status,
  });

  Map<String, dynamic> toFirestore() {
    return {
      "files": files.map((file) => file.toFirestore()).toList(),
      "long": long,
      "lat": lat,
      "status": 'PENDING',
    };
  }
}
