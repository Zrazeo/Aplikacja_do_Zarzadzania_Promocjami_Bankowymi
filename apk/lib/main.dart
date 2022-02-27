import 'package:flutter/material.dart';
import './screens/prom_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikacja do promocji bankowych',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PromScreen(),
    );
  }
}