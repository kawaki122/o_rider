import 'package:flutter/material.dart';
import 'package:o_rider/components/BottomBar.dart';
import 'package:o_rider/components/LocationCard.dart';
import 'package:o_rider/models/AppModel.dart';
import 'package:o_rider/screens/Detail.dart';
import 'package:o_rider/services/DataService.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    DataService service = DataService();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Dashboard'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: model.tasks.length,
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
      ),
    );
  }
}
