import 'package:flutter/material.dart';
import 'package:o_rider/components/VideoSection.dart';
import 'package:o_rider/models/FileModel.dart';

class Media extends StatelessWidget {
  const Media({super.key, required this.file});
  final FileModel file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Center(child: file.type=='video'? VideoSection() :Image.asset('images/bilboard.jpg')),
    );
  }
}
