import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.onTap, required this.url});
  final void Function() onTap;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
