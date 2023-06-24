import 'package:cloud_firestore/cloud_firestore.dart';

class LocationRaw {
  final String? id;
  final String? address;
  final String? campaign;
  final String? city;
  final String? traficFlow;
  final int? height;
  final int? width;
  final List<String>? files;
  final num? long;
  final num? lat;

  LocationRaw({
    this.id,
    this.address,
    this.campaign,
    this.city,
    this.traficFlow,
    this.height,
    this.width,
    this.files,
    this.long,
    this.lat,
  });

  factory LocationRaw.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return LocationRaw(
      id: snapshot.id,
      address: data?['address'],
      campaign: data?['campaign'],
      city: data?['city'],
      traficFlow: data?['trafic_flow'],
      height: data?['height'],
      width: data?['width'],
      files:
          data?['files'] is Iterable ? List.from(data?['files']) : null,
      long: data?['long'],
      lat: data?['lat'],
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
      if (long != null) "long": long,
      if (lat != null) "lat": lat,
    };
  }
}