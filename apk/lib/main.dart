import 'package:aplikacja_do_promocji_bankowych/model/karencja.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(KarencjaAdapter());
  Hive.registerAdapter(MyFavoriteAdapter());
  // await Hive.openBox<Karencja>('karencja');
  // await Hive.openBox<MyFavorite>('myFavorite');

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
      home: PinScreen(),
    );
  }
}
