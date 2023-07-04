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
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Center(child: file.type=='video'? VideoSection(url: file.url,) :Image.asset('images/bilboard.jpg')),
    );
  }
}
