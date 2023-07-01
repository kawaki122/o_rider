import 'package:flutter/material.dart';
import 'package:o_rider/models/FileModel.dart';

class Uploading extends StatelessWidget {
  const Uploading({super.key, required this.file});
  final FileModel file;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      margin: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            value: file.progress,
            backgroundColor: Colors.grey[300],
          ),
          Text('Uploading...', style: TextStyle(color: Colors.grey),),
        ],
      ),
    );
  }
}
