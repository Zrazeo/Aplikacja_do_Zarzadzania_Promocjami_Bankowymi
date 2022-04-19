import 'package:aplikacja_do_promocji_bankowych/screens/wymogi_testowe.dart';
import 'package:flutter/material.dart';

import 'package:aplikacja_do_promocji_bankowych/screens/wymogi_screen.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/stat_screen.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/karencja_screen.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/moje_promki_screen.dart';

import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Panel extends StatefulWidget {
  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Aplikacja do zarządzania promocjami bankowymi',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 23,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Statystyki'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.timelapse),
            title: Text('Karencja'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KarencjaScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Moje promocje'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MojePromocjeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.check),
            title: Text('Warunki do spełenienia'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WymogiTestowe()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text('Zmiana kodu PIN'),
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Ustaw nowy pin'),
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          autofocus: true,
                          controller: controller,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Pin nie może być pusty!';
                            } else if (value.length < 4) {
                              return 'Pin musi mieć 4 cyfry!';
                            } else if (!RegExp(r'^\d{4}$').hasMatch(value)) {
                              return 'Pin może zawierać tylko cyfry!';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                submit();
                              }
                            },
                            child: Text('Zmień')),
                      ],
                    ),
                  ),
                  // actions: [
                  //   TextButton(onPressed: submit, child: Text('Zmień'))
                  // ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<String> get _localPath async {
    var directory = await getExternalStorageDirectory();
    directory ??= await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/pin.txt');
  }

  Future<File> write(String data) async {
    final file = await _localFile;
    // Write the file in append mode so it would append the data to existing file
    // if it already exists
    return file.writeAsString('$data\n');
  }

  Future<String> readData() async {
    try {
      final file = await _localFile;
      String body = await file.readAsString();
      print(body);
      return body;
    } catch (e) {
      return e.toString();
    }
  }

  void submit() {
    Navigator.of(context).pop(controller.text);
    write(controller.text);
    readData();

    controller.text = '';
  }
}
