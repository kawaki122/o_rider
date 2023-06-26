import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '../models/Task.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.onTap, required this.task});
  final void Function() onTap;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 120,
                width: 160,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: ImageNetwork(
                    image: task.files.isNotEmpty ? task.files[0]:task.brandLogo,
                    height: 120,
                    width: 160,
                  ),
                ),
              ),
            Expanded(
              child: ListTile(
                title: Text(
                  task.brandName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  task.address,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                // trailing: Icon(Icons.location_on, color: Colors.redAccent,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
