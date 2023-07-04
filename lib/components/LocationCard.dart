import 'package:flutter/material.dart';
import '../models/TaskViewModel.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.onTap, required this.task});
  final void Function() onTap;
  final TaskViewModel task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 120,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Image.network(task.files.isNotEmpty ? task.files[0].thumb:task.brandLogo, fit: BoxFit.cover,),
                ),
              ),),
            Expanded(
              flex: 2,
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
