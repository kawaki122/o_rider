import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_rider/components/AddFile.dart';
import 'package:o_rider/components/ImageItem.dart';
import 'package:o_rider/components/MapItem.dart';
import 'package:o_rider/components/Uploading.dart';
import 'package:o_rider/models/AppModel.dart';
import 'package:o_rider/models/FileModel.dart';
import 'package:o_rider/models/TaskViewModel.dart';
import 'package:o_rider/screens/Media.dart';
import 'package:quickalert/quickalert.dart';
import 'package:scoped_model/scoped_model.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) {
        TaskViewModel task = model.tasks[model.selectedTask];
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                child: ListView.builder(
                  itemCount: task.files.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    if (index > task.files.length - 1) {
                      return AddFile(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        final ImagePicker picker =
                                            ImagePicker();
                                        final XFile? photo =
                                            await picker.pickImage(
                                                source: ImageSource.camera,
                                                // maxHeight: 500,
                                                // maxWidth: 500,
                                                imageQuality: 50);
                                        if (photo != null) {
                                          model.uploadFile(
                                              photo, index, 'image');
                                        }
                                      },
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera,
                                            color: Colors.red,
                                          ),
                                          Text(
                                            'Photo',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        final ImagePicker picker =
                                            ImagePicker();
                                        final XFile? video =
                                            await picker.pickVideo(
                                          source: ImageSource.camera,
                                          maxDuration: Duration(seconds: 10),
                                        );
                                        if (video != null) {
                                          model.uploadFile(
                                              video, index, 'video');
                                        }
                                      },
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.video_camera_back,
                                            color: Colors.red,
                                          ),
                                          Text(
                                            'Video',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (task.files[index].status ==
                        FileStatus.uploading) {
                      return Uploading(file: task.files[index]);
                    }
                    return ImageItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Media(
                              file: task.files[index],
                            ),
                          ),
                        );
                      },
                      file: task.files[index],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  task.brandName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18, top: 4, bottom: 2),
                child: Row(
                  children: [
                    Text(
                      '(${task.rating}) ',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    RatingBar.builder(
                      initialRating: task.rating.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 17,
                      // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  task.address,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              MapItem(
                onLocation: model.loadLocation,
                loading: task.locationLoading,
                locationExist: task.long != 0,
              ),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                height: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: TextButton(
                  onPressed: () {
                    model.handleSubmit(model.selectedTask,
                        (bool loading, bool error) {
                      if (loading) {
                        QuickAlert.show(
                          context: context,
                          barrierDismissible: false,
                          type: QuickAlertType.loading,
                          title: 'Submitting...',
                        );
                      } else {
                        Navigator.pop(context);
                        if (error) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Failed submit',
                            autoCloseDuration: Duration(seconds: 3),
                          );
                        } else {
                          Navigator.pop(context, 'action_added');
                        }
                      }
                    });
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
