import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 3,
          child: Column(
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width-28,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.asset('images/bilboard.jpg', fit: BoxFit.cover,),
                ),
              ),
              ListTile(
                title: Text(
                  'Telenor',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Firdaos Market flyover Lahore Firdaos Market flyover Lahore',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                // trailing: Icon(Icons.location_on, color: Colors.redAccent,),
              )
            ],
          ),
        ));
  }
}
