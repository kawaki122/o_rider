import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_rider/models/Task.dart';
import 'package:o_rider/models/raw/BrandRaw.dart';
import 'package:o_rider/models/raw/CampaignRaw.dart';
import 'package:o_rider/models/raw/LocationRaw.dart';
import 'package:o_rider/models/raw/TaskRaw.dart';

class DataService {
  CollectionReference<CampaignRaw> campaignsRef =
      FirebaseFirestore.instance.collection('campaigns').withConverter(
            fromFirestore: CampaignRaw.fromFirestore,
            toFirestore: (CampaignRaw city, _) => city.toFirestore(),
          );
  CollectionReference<LocationRaw> locationsRef =
      FirebaseFirestore.instance.collection('locations').withConverter(
            fromFirestore: LocationRaw.fromFirestore,
            toFirestore: (LocationRaw city, _) => city.toFirestore(),
          );
  CollectionReference<TaskRaw> tasksRef =
      FirebaseFirestore.instance.collection('tasks').withConverter(
            fromFirestore: TaskRaw.fromFirestore,
            toFirestore: (TaskRaw city, _) => city.toFirestore(),
          );

  DataService() {
    fetchTasks();
  }

  Future<List<Task>> fetchTasks() async {
    try {
      final result = await Future.wait([
        campaignsRef.get(),
        locationsRef.get(),
        tasksRef.get(),
      ]);
      List<Task> tasks = result[2].docs.map((element) {
        final task = element.data() as TaskRaw;
        final location = result[1]
            .docs
            .firstWhere((element) => element.id == task.id)
            .data() as LocationRaw;
        final campaign = result[0]
            .docs
            .firstWhere((element) => element.id == task.id)
            .data() as CampaignRaw;
        return Task(
          id: task.id!,
          address: location.address!,
          brand: campaign.brand!.name!,
          files: location.files!,
          long: location.long,
          lat: location.lat,
        );
      }).toList();
      return tasks;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
