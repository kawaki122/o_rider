import 'package:flutter/material.dart';
import 'package:o_rider/components/BottomBar.dart';
import 'package:o_rider/components/LocationCard.dart';
import 'package:o_rider/screens/Detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Dashboard'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return LocationCard(onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Detail()),
            );
          });
        },
      ),
      bottomNavigationBar: BottomBar(index: 0, onSelected: (index) {}),
    );
  }
}
