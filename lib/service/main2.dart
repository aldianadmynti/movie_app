import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/service/api_service.dart';

import '../firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Coba());
  }
}

class Coba extends StatelessWidget {
  Coba({super.key});
  var service = ApiService();

  void printdata() async {
    var a = await service.search('iron man');
    a.forEach((element) {
      print(element.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              printdata();
            },
            child: Text('data')),
      ),
    );
  }
}
