import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o_rider/models/FileModel.dart';
import 'package:o_rider/models/TaskViewModel.dart';
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

  DataService() {}

  Future<List<TaskViewModel>> fetchTasks() async {
    try {
      final result = await Future.wait([
        campaignsRef.get(),
        locationsRef.get(),
        tasksRef.get(),
      ]);

      List<TaskViewModel> tasks = result[2].docs.map((element) {
        final task = element.data() as TaskRaw;

        final location = result[1]
            .docs
            .firstWhere((element) => element.id == task.location)
            .data() as LocationRaw;

        final campaign = result[0]
            .docs
            .firstWhere((element) => element.id == task.campaign)
            .data() as CampaignRaw;

        return TaskViewModel(
          id: task.id!,
          address: location.address!,
          brandName: campaign.brand!.name!,
          brandLogo: campaign.brand!.logo!,
          files: location.files!
              .map((file) => FileModel(
                    status: FileStatus.loaded,
                    url: file.file!,
                    thumb: file.thumb!,
                    type: file.type!,
                    progress: 100,
                  ))
              .toList(),
          long: task.long!,
          lat: task.lat!,
          rating: location.rating!,
          status: task.status!,
        );
      }).toList();

      return tasks;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> submitTask(TaskViewModel task) {
    return tasksRef.doc(task.id).update(task.toFirestore());
  }
}
