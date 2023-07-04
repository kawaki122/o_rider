import 'package:flutter/material.dart';
import 'package:o_rider/models/FileModel.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.onTap, required this.file});
  final void Function() onTap;
  final FileModel file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
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
            margin:
                const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                file.thumb,
                fit: BoxFit.cover,
              ),
            ),
          ),
          file.type == 'video'
              ? Container(
                  margin: const EdgeInsets.only(
                      right: 10, left: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
