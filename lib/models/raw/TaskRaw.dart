import 'package:cloud_firestore/cloud_firestore.dart';

class TaskRaw {
  final String? campaign;
  final String? location;
  final String? status;
  final bool? created;

  TaskRaw({
    this.campaign,
    this.location,
    this.status,
    this.created,
  });

  factory TaskRaw.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TaskRaw(
      campaign: data?['campaign'],
      location: data?['location'],
      status: data?['status'],
      created: data?['created'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (campaign != null) "campaign": campaign,
      if (location != null) "location": location,
      if (status != null) "status": status,
      if (created != null) "created": created,
    };
  }
}