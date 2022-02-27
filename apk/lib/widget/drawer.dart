import 'package:flutter/material.dart';

import 'package:aplikacja_do_promocji_bankowych/screens/wymogi_screen.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/stat_screen.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/karencja_screen.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/moje_promki_screen.dart';

class drawer extends StatelessWidget {
  const drawer({
    Key key,
  }) : super(key: key);

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
                MaterialPageRoute(builder: (context) => WymogiScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
