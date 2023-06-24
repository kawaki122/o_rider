
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_rider/models/Brand.dart';

class CampaignRaw {
  final Brand? brand;
  final String? from;
  final String? to;
  final String? status;

  CampaignRaw({
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
      brand: Brand.fromFirestore(data?['brand'], options),
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