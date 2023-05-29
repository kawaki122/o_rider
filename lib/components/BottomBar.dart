
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int index;
  final void Function(int)? onSelected;
  const BottomBar({super.key, required this.index, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: index,
        selectedItemColor: Colors.amber[800],
        onTap: onSelected,
      );
  }
}