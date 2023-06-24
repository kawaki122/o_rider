import 'package:cloud_firestore/cloud_firestore.dart';

class Brand {
  final String? id;
  final String? name;
  final String? logo;

  Brand({
    this.id,
    this.name,
    this.logo,
  });

  factory Brand.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Brand(
      id: data?['id'],
      name: data?['name'],
      logo: data?['logo'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (logo != null) "logo": logo,
    };
  }
}