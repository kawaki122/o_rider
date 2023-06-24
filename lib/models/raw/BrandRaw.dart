import 'package:cloud_firestore/cloud_firestore.dart';

class BrandRaw {
  final String? id;
  final String? name;
  final String? logo;

  BrandRaw({
    this.id,
    this.name,
    this.logo,
  });

  factory BrandRaw.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return BrandRaw(
      id: snapshot.id,
      name: data?['name'],
      logo: data?['logo'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (logo != null) "logo": logo,
    };
  }
}