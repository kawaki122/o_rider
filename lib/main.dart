import 'package:flutter/material.dart';
import 'package:o_rider/screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'O Rider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 167, 48, 39)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

