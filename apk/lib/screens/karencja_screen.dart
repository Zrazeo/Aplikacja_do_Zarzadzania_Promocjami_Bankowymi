import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:aplikacja_do_promocji_bankowych/model/karencja.dart';
import 'package:aplikacja_do_promocji_bankowych/widget/karencja_dialog.dart';
import 'package:aplikacja_do_promocji_bankowych/widget/boxes.dart';

class KarencjaScreen extends StatefulWidget {
  @override
  _KarencjaScreen createState() => _KarencjaScreen();
}

class _KarencjaScreen extends State<KarencjaScreen> {
  @override
  void dispose() {
    Hive.box<Karencja>('karencja').close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void deleteKarencja(Karencja karencja) {
      karencja.delete();
    }

    void editKarencja(
      Karencja karencja,
      String nazwa,
      String data,
    ) {
      karencja.nazwa = nazwa;
      karencja.data = data;

      karencja.save();
    }

    Widget buildButtons(BuildContext context, Karencja karencja) => Row(
          children: [
            Expanded(
              child: TextButton.icon(
                label: Text('Edytuj'),
                icon: Icon(Icons.edit),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => KarencjaDialog(
                      karencja: karencja,
                      onClickedDone: (
                        nazwa,
                        data,
                      ) =>
                          editKarencja(
                        karencja,
                        nazwa,
                        data,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton.icon(
                label: Text('Usuń'),
                icon: Icon(Icons.delete),
                onPressed: () => deleteKarencja(karencja),
              ),
            )
          ],
        );

    Future addKarencja(String nazwa, String data) async {
      final karencja = Karencja()
        ..nazwa = nazwa
        ..data = data;

      final box = Boxes.getKarencja();
      box.add(karencja);
      //box.put('mykey', karencja);

      // final mybox = Boxes.getkarencja();
      // final mykarencja = mybox.get('key');
      // mybox.values;
      // mybox.keys;
    }

    Widget buildKarencja(
      BuildContext context,
      Karencja karencja,
    ) {
      final data = karencja.data;

      return Card(
        color: Colors.white,
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          title: Text(
            karencja.nazwa,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(data),
          trailing: Text(
            data,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          children: [
            buildButtons(context, karencja),
          ],
        ),
      );
    }

    Widget buildContent(List<Karencja> karencja) {
      if (karencja.isEmpty) {
        return Center(
          child: Text(
            'Brak zamkniętych kont',
            style: TextStyle(fontSize: 24),
          ),
        );
      } else {
        return Column(
          children: [
            SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: karencja.length,
                itemBuilder: (BuildContext context, int index) {
                  final karencja1 = karencja[index];

                  return buildKarencja(context, karencja1);
                },
              ),
            ),
          ],
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Karencja'),
      ),
      body: FutureBuilder(
          future: Hive.openBox<Karencja>('karencja'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return ValueListenableBuilder<Box<Karencja>>(
                  valueListenable: Boxes.getKarencja().listenable(),
                  builder: (context, box, _) {
                    final karencja = box.values.toList().cast<Karencja>();

                    return buildContent(karencja);
                  },
                );
              }
            } else {
              return const SizedBox();
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => KarencjaDialog(
            onClickedDone: addKarencja,
          ),
        ),
      ),
    );
  }
}
