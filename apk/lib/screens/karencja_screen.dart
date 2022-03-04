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
    Hive.box('karencja').close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void deleteKarencja(Karencja karencja) {
      // final box = Boxes.getkarencja();
      // box.delete(karencja.key);

      karencja.delete();
      //setState(() => karencja.remove(karencja));
    }

    void editKarencja(
      Karencja karencja,
      String nazwa,
      String data,
    ) {
      karencja.nazwa = nazwa;
      karencja.data = data;

      // final box = Boxes.getkarencja();
      // box.put(karencja.key, karencja);

      karencja.save();
    }

    Widget buildButtons(BuildContext context, Karencja karencja) => Row(
          children: [
            Expanded(
              child: TextButton.icon(
                label: Text('Edit'),
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
                label: Text('Delete'),
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
      final nazwa = karencja.nazwa;

      return Card(
        color: Colors.white,
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          title: Text(
            karencja.nazwa,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(nazwa),
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
            'No expenses yet!',
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
      body: ValueListenableBuilder<Box<Karencja>>(
        valueListenable: Boxes.getKarencja().listenable(),
        builder: (context, box, _) {
          final karencja = box.values.toList().cast<Karencja>();

          return buildContent(karencja);
        },
      ),
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
