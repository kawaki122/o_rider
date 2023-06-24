
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_rider/models/raw/BrandRaw.dart';

class CampaignRaw {
  final BrandRaw? brand;
  final String? id;
  final String? from;
  final String? to;
  final String? status;

  CampaignRaw({
    this.id,
    this.brand,
    this.from,
    this.to,
    this.status,
  });

  factory CampaignRaw.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CampaignRaw(
      brand: BrandRaw.fromFirestore(data?['brand'], options),
      id: snapshot.id,
      from: data?['from'],
      to: data?['to'],
      status: data?['status'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (brand != null) "brand": brand!.toFirestore(),
      if (from != null) "from": from,
      if (to != null) "to": to,
      if (status != null) "status": status,
    };
  }
}