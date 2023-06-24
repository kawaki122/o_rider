import 'package:cloud_firestore/cloud_firestore.dart';

class LocationRaw {
  final String? address;
  final String? campaign;
  final String? city;
  final String? traficFlow;
  final int? height;
  final int? width;
  final List<String>? files;

  LocationRaw({
    this.address,
    this.campaign,
    this.city,
    this.traficFlow,
    this.height,
    this.width,
    this.files,
  });

  factory LocationRaw.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return LocationRaw(
      address: data?['address'],
      campaign: data?['campaign'],
      city: data?['city'],
      traficFlow: data?['trafic_flow'],
      height: data?['height'],
      width: data?['width'],
      files:
          data?['files'] is Iterable ? List.from(data?['files']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (address != null) "address": address,
      if (campaign != null) "campaign": campaign,
      if (city != null) "city": city,
      if (traficFlow != null) "trafic_flow": traficFlow,
      if (height != null) "height": height,
      if (width != null) "width": width,
      if (files != null) "files": files,
    };
  }
}