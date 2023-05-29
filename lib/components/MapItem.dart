import 'package:flutter/material.dart';

class MapItem extends StatelessWidget {
  const MapItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.red,
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
              Icons.add,
              size: 60,
            ),
          )),
        ],
      ),
    );
  }
}
