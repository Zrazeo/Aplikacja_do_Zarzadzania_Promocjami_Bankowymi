import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget textWidget(
        String text, double fontSize, FontWeight bold, TextAlign textAlign) =>
    Padding(
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
  bool _isFavorite = false;

  void _changeFavourite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

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
              icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_outline))
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
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
