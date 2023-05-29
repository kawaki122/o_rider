import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:o_rider/components/ImageItem.dart';
import 'package:o_rider/components/MapItem.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ImageItem();
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Telenor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 18, top: 4, bottom: 2),
              child: Row(
                children: [
                  Text(
                    '(3) ',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  RatingBar.builder(
                    initialRating: 3,
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
              'Firdaos Market flyover Lahore Firdaos Market flyover Lahore Firdaos Market flyover Lahore Firdaos Market flyover Lahore',
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
  }
}
