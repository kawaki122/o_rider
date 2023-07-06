import 'package:flutter/material.dart';

class MapItem extends StatelessWidget {
  const MapItem({
    super.key,
    required this.onLocation,
    required this.loading,
    required this.loaded,
    required this.locationExist,
  });
  final void Function() onLocation;
  final bool loading;
  final bool loaded;
  final bool locationExist;

  _renderAction() {
    if (loading) {
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 6.0,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          Icons.location_searching,
          size: 40,
          color: Colors.grey,
        ),
      );
    } else if (loaded) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 6.0,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 60,
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          onLocation();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 6.0,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            locationExist ? Icons.cached : Icons.add,
            size: 60,
            color: locationExist ? Colors.green : Colors.grey,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(
        right: 20,
        left: 20,
        top: 30,
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 40,
            child: Image.asset(
              'images/map.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: _renderAction(),
          ),
        ],
      ),
    );
  }
}
