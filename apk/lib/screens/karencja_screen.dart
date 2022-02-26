import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class KarencjaScreen extends StatefulWidget {
  @override
  _KarencjaScreen createState() => _KarencjaScreen();
}

class _KarencjaScreen extends State<KarencjaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Karencja'),
        ),
        body: Container(
          child: Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/karencja.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var new_data = json.decode(snapshot.data.toString());

                  return ListView.builder(
                    // Build the ListView
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text("Nazwa Banku: " + new_data[index]['name']),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Data zamknięcia konta: " + new_data[index]['data']),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: new_data == null ? 0 : new_data.length,
                  );
                }),
          ),
        ));
  }
}
