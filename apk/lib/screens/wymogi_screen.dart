import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class WymogiScreen extends StatefulWidget {
  @override
  _WymogiScreenPageState createState() => _WymogiScreenPageState();
}

class _WymogiScreenPageState extends State<WymogiScreen> {
  bool maj2021 = false;
  bool czerwiec2021_1 = false;
  bool czerwiec2021_2 = false;
  bool lipiec2021 = false;
  bool sierpien2021_1 = false;
  bool sierpien2021_2 = false;
  bool sierpien2021_3 = false;
  bool wrzesien2021_1 = false;
  bool wrzesien2021_2 = false;
  bool pazdziernik_1 = false;
  bool pazdziernik_2 = false;
  bool pazdziernik_3 = false;
  bool listopad = false;

  // List<bool> lista = [];

  String stringList = '';

  _read() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/my_file.txt');
      String text = await file.readAsString();
      List result = text.split(', ');
      setState(() {
        maj2021 = result[0] == 'true';
        czerwiec2021_1 = result[1] == 'true';
        czerwiec2021_2 = result[2] == 'true';
        lipiec2021 = result[3] == 'true';
        sierpien2021_1 = result[4] == 'true';
        sierpien2021_2 = result[5] == 'true';
        sierpien2021_3 = result[6] == 'true';
        wrzesien2021_1 = result[7] == 'true';
        wrzesien2021_2 = result[8] == 'true';
        pazdziernik_1 = result[9] == 'true';
        pazdziernik_2 = result[10] == 'true';
        pazdziernik_2 = result[11] == 'true';
        pazdziernik_3 = result[12] == 'true';
        listopad = result[13] == 'true';
      });

      print(listopad);
    } catch (e) {
      print(e);
    }
  }

  _save() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    await file.writeAsString(stringList);
    print('$stringList');
  }

  @override
  void initState() {
    _read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    stringList =
        '$maj2021, $czerwiec2021_1, $czerwiec2021_2, $lipiec2021, $sierpien2021_1, $sierpien2021_2, $sierpien2021_3, $wrzesien2021_1, $wrzesien2021_2, $pazdziernik_1, $pazdziernik_2, $pazdziernik_2, $pazdziernik_3, $listopad';
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Warunki do spełnienia')),
        actions: [
          // IconButton(onPressed: _read, icon: Icon(Icons.refresh)),
          IconButton(onPressed: _save, icon: Icon(Icons.save)),
          IconButton(
            icon: const Icon(Icons.web_rounded),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Reward();
              }),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          const Text(
            'Styczeń 2022',
            style: TextStyle(fontSize: 18),
          ),
          CheckboxListTile(
            value: maj2021,
            title: const Text('Wykonaj min. 1 przelew'),
            onChanged: (_) {
              setState(() {
                maj2021 = !maj2021;
              });
              _save();
            },
          ),
          const Divider(),
          const Text(
            'Luty 2022',
            style: TextStyle(fontSize: 18),
          ),
          CheckboxListTile(
            value: czerwiec2021_1,
            title: const Text('Wpływy min. 1000 '),
            onChanged: (_) {
              setState(() {
                czerwiec2021_1 = !czerwiec2021_1;
              });
              _save();
            },
          ),
          CheckboxListTile(
            value: czerwiec2021_2,
            title: const Text('Wykonaj min. 3 przelewy'),
            onChanged: (_) {
              setState(() {
                czerwiec2021_2 = !czerwiec2021_2;
              });
              _save();
            },
          ),
          const Divider(),
          const Text(
            'Marzec 2022',
            style: TextStyle(fontSize: 18),
          ),
          CheckboxListTile(
            value: lipiec2021,
            title: const Text('Wykonaj min. 3 płatności Google Pay'),
            onChanged: (_) {
              setState(() {
                lipiec2021 = !lipiec2021;
              });
              _save();
            },
          ),
          const Text(
            'Kwiecień 2022',
            style: TextStyle(fontSize: 18),
          ),
          CheckboxListTile(
            value: sierpien2021_1,
            title: const Text('Wpływy min. 1000'),
            onChanged: (_) {
              setState(() {
                sierpien2021_1 = !sierpien2021_1;
              });
              _save();
            },
          ),
          CheckboxListTile(
            value: sierpien2021_2,
            title: const Text('Wykonaj min. 3 przelewy'),
            onChanged: (_) {
              setState(() {
                sierpien2021_2 = !sierpien2021_2;
              });
              _save();
            },
          ),
          CheckboxListTile(
            value: sierpien2021_3,
            title: const Text('Wykonaj min. 5 transakcji bezgotówkowych'),
            onChanged: (_) {
              setState(() {
                sierpien2021_3 = !sierpien2021_3;
              });
              _save();
            },
          ),
          const Divider(),
          const Text(
            'Maj 2022',
            style: TextStyle(fontSize: 18),
          ),
          CheckboxListTile(
            value: wrzesien2021_1,
            title: const Text('Wpływy min. 1000 zł'),
            onChanged: (_) {
              setState(() {
                wrzesien2021_1 = !wrzesien2021_1;
              });
              _save();
            },
          ),
          CheckboxListTile(
            value: wrzesien2021_2,
            title: const Text('Wykonaj transkacje bezgotówkowe na min. 500 zł'),
            onChanged: (_) {
              setState(() {
                wrzesien2021_2 = !wrzesien2021_2;
              });
              _save();
            },
          ),
          const Divider(),
          const Text(
            'Czerwiec 2022',
            style: TextStyle(fontSize: 18),
          ),
          CheckboxListTile(
            value: pazdziernik_1,
            title: const Text('Wpływy min. 1000'),
            onChanged: (_) {
              setState(() {
                pazdziernik_1 = !pazdziernik_1;
              });
              _save();
            },
          ),
          CheckboxListTile(
            value: pazdziernik_2,
            title: const Text('Wykonaj min. 3 przelewy'),
            onChanged: (_) {
              setState(() {
                pazdziernik_2 = !pazdziernik_2;
              });
              _save();
            },
          ),
          CheckboxListTile(
            value: pazdziernik_3,
            title: const Text('Wykonaj min. 5 transakcji przez Google Pay'),
            onChanged: (_) {
              setState(() {
                pazdziernik_3 = !pazdziernik_3;
              });
              _save();
            },
          ),
          const Divider(),
          const Text(
            'Lipiec 2022',
            style: TextStyle(fontSize: 18),
          ),
          CheckboxListTile(
            value: listopad,
            title: const Text('Korzystaj z konta'),
            onChanged: (_) {
              setState(() {
                listopad = !listopad;
              });
              _save();
            },
          ),
        ],
      ),
    );
  }
}

class Reward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nagrody'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Styczeń 50 zł w Lutym',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Luty 100 zł w Marcu',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Marzec 50 zł w Kwietniu',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Kwiecień 150 zł w Maju',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Maj 100 zł w Czerwcu',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Czerwiec 150 zł w Lipcu',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Lipiec 50 zł do Biedronki w Sierpniu',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
