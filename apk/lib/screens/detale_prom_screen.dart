import 'package:aplikacja_do_promocji_bankowych/model/karencja.dart';
import 'package:aplikacja_do_promocji_bankowych/potestuje.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

//wychodzenie strzalka to zapis do bazy

Widget textWidget(String text, double fontSize, FontWeight bold, TextAlign textAlign) => Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: bold,
        ),
        textAlign: textAlign,
      ),
    );

class DetaleScreen extends StatefulWidget {
  final DocumentSnapshot<Object> promotion;
  DetaleScreen(this.promotion);

  @override
  State<DetaleScreen> createState() => _DetaleScreenState();
}

class _DetaleScreenState extends State<DetaleScreen> {
  SharedPreferences prefs;
  Map<String, Map<String, bool>> mapa = {};
  bool _isFavorite = false;

  save(bool isFavorite) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFavorite", isFavorite);
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    _isFavorite = prefs.getBool("isFavorite") ?? false;
    print(_isFavorite);
    setState(() {});
  }

  void _changeFavourite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    save(_isFavorite);
    bazadanych();
  }

  void bazadanych() async {
    await Hive.openBox<MyFavorite>('myFavorite');
    final testowa = Hive.box<MyFavorite>('myFavorite');
// print(testowa.putAt(index, value))
    // testowa.deleteAt(testowa.values.length - 1);
    print(widget.promotion['nagrody'].runtimeType);
    dodaj(testowa, int.parse(widget.promotion['ide']), _isFavorite, widget.promotion['Nazwa banku'], widget.promotion['nagrody']);
    print(testowa.values.length);
  }

  void dodaj(Box<MyFavorite> box, int id, bool isFavorite, String bankName, Map<String, dynamic> rewards) {
    final wrzuc = MyFavorite()
      ..id = id
      ..bankName = bankName
      ..isFavorite = isFavorite
      ..rewards = rewards
      ..requirements = _mapOfRequirements();
    // box.add(wrzuc);
    box.put(id, wrzuc);
  }

  Map<String, Map<String, bool>> _mapOfRequirements() {
    List<String> keys = widget.promotion['wymagania'].keys.toList();
    List<dynamic> values = widget.promotion['wymagania'].values.toList();
    Map<String, bool> mapOfTheMonth = {};
    for (int i = 0; i < keys.length; i++) {
      for (int j = 0; j < values[i].length; j++) {
        mapOfTheMonth[values[i][j]] = false;
      }
      print(mapOfTheMonth);
      mapa[keys[i]] = mapOfTheMonth;
      mapOfTheMonth = {};
    }
    print(mapa);
    return mapa;
  }

  @override
  void initState() {
    retrieve();
    // bazadanych();
    super.initState();
  }

  // @override
  // void dispose() {
  //   Hive.box<MyFavorite>('myFavorite').close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    String _url = widget.promotion['Link promocji'];

    void _launchURL() async {
      if (!await launch(_url)) throw 'Could not launch $_url';
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BNP Paribas'),
        actions: [
          IconButton(
            onPressed: _changeFavourite,
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_outline),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Potestuje()),
              );
            },
            icon: Icon(Icons.abc),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            textWidget(
              widget.promotion['Tytul'],
              25,
              FontWeight.bold,
              TextAlign.justify,
            ),
            SizedBox(),
            textWidget(
              'Opis promocji',
              22,
              FontWeight.bold,
              TextAlign.center,
            ),
            textWidget(
              widget.promotion['Opis promocji'],
              16,
              FontWeight.normal,
              TextAlign.justify,
            ),
            Text(''),
            textWidget(
              'Nagrody szczegóły',
              22,
              FontWeight.bold,
              TextAlign.center,
            ),
            textWidget(
              widget.promotion['Nagrody szczegoly'],
              16,
              FontWeight.normal,
              TextAlign.justify,
            ),
            Text(''),
            textWidget(
              'Zasady promocji',
              22,
              FontWeight.bold,
              TextAlign.center,
            ),
            textWidget(
              widget.promotion['Zasady promocji'],
              16,
              FontWeight.normal,
              TextAlign.justify,
            ),
            Container(
              color: Colors.white,
              child: TextButton(
                onPressed: _launchURL,
                child: Text(
                  'Przejdź do promocji!',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
