import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_rider/models/raw/FileRaw.dart';

class LocationRaw {
  final String? id;
  final String? address;
  final String? campaign;
  final String? city;
  final String? traficFlow;
  final String? height;
  final String? width;
  final List<FileRaw>? files;
  final num? long;
  final num? lat;
  final num? rating;

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
    this.rating,
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
      files: (data?['files'] as List?)
        ?.map((fileData) => FileRaw.fromFirestore(fileData, options))
        .toList(),
      long: data?['long'],
      lat: data?['lat'],
      rating: data?['rating'],
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
      if (files != null) "files": files!.map((file) => file.toFirestore()).toList(),
      if (long != null) "long": long,
      if (lat != null) "lat": lat,
      if (rating != null) "rating": rating,
    };
  }
}