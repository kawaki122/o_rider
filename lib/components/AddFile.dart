import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddFile extends StatelessWidget {
  const AddFile({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: Colors.grey,
        dashPattern: [8, 4],
        strokeWidth: 2,
        radius: Radius.circular(12),
        padding: EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Container(
            height: 200,
            width: 200,
            child: Center(
              child: Icon(
                Icons.add_a_photo,
                size: 60,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    ),);
  }
}
