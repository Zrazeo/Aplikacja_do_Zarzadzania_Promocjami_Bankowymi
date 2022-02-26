import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class KarencjaScreen extends StatefulWidget {
  @override
  _KarencjaScreen createState() => _KarencjaScreen();
}

class _KarencjaScreen extends State<KarencjaScreen> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/karencja.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Karencja'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(_items[index]["name"]),
                    subtitle: Text(_items[index]["data"]),
                    // itemCount: 20,
                    // separatorBuilder: (context, index) {
                    //   return Divider();
                    // },
                    // itemBuilder: (context, index) {
                    //   return Material(
                    //     child: ListTile(
                    //       title: Text('Nazwa Banku'),
                    //       subtitle: Text('Data zamknięcia konta'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Dodaj bank'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
