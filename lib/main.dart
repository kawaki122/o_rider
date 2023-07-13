import 'package:flutter/material.dart';
import 'package:o_rider/models/AppModel.dart';
import 'package:o_rider/screens/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:o_rider/screens/Login.dart';
import 'package:o_rider/screens/Splash.dart';
import 'package:scoped_model/scoped_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: AppModel(),
      child: MaterialApp(
        title: 'O Rider',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 167, 48, 39)),
          useMaterial3: true,
        ),
        home: ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => _renderMain(model.initialState),
        ),
      ),
    );
  }
}

Widget _renderMain(String state) {
  if(state == 'loading') {
    return Splash();
  } else if(state == 'no_auth') {
    return Login();
  } else {
    return Home();
  }
}
