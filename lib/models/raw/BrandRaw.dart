import 'package:cloud_firestore/cloud_firestore.dart';

class BrandRaw {
  final String? name;
  final String? logo;

  BrandRaw({
    this.name,
    this.logo,
  });

  factory BrandRaw.fromFirestore(
    Map<String, dynamic> data,
    SnapshotOptions? options,
  ) {
    return BrandRaw(
      name: data['name'],
      logo: data['logo'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (logo != null) "logo": logo,
    };
  }
}