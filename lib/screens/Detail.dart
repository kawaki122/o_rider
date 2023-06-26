import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:o_rider/components/AddFile.dart';
import 'package:o_rider/components/ImageItem.dart';
import 'package:o_rider/components/MapItem.dart';
import 'package:o_rider/models/AppModel.dart';
import 'package:o_rider/models/Task.dart';
import 'package:scoped_model/scoped_model.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) {
        Task task = model.tasks[model.selectedTask];
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
                        onTap: () {},
                      );
                    }
                    return ImageItem(
                      onTap: () {},
                      url: task.files[index],
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
                        initialRating: task.rating as double,
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
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  task.address,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              MapItem(),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                height: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: TextButton(
                  onPressed: () {},
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
