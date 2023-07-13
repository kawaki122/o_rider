import 'package:cloud_firestore/cloud_firestore.dart';

class TaskRaw {
  final String? id;
  final String? campaign;
  final String? location;
  final String? status;
  final String? created;
  final num? long;
  final num? lat;

  TaskRaw({
    this.id,
    this.campaign,
    this.location,
    this.status,
    this.created,
    this.long,
    this.lat,
  });

  factory TaskRaw.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TaskRaw(
      id: snapshot.id,
      campaign: data?['campaign'],
      location: data?['location'],
      status: data?['status'],
      long: data?['long'],
      lat: data?['lat'],
      created: data?['created'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (campaign != null) "campaign": campaign,
      if (location != null) "location": location,
      if (status != null) "status": status,
      if (long != null) "long": long,
      if (lat != null) "lat": lat,
      if (created != null) "created": created,
    };
  }
}