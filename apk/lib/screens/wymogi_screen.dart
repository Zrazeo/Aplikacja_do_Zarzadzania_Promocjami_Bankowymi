import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class WymogiScreen extends StatefulWidget {
  @override
  _WymogiScreen createState() => _WymogiScreen();
}

class _WymogiScreen extends State<WymogiScreen> {
  bool _checkboxListTile = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Warunki promocji'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Wykonaj tranzakcje o 50 zł'),
            value: _checkboxListTile,
            onChanged: (value) {
              setState(() {
                _checkboxListTile = !_checkboxListTile;
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Wpływ na konto o kwocie 500 zł'),
            value: _checkboxListTile,
            onChanged: (value) {
              setState(() {
                _checkboxListTile = !_checkboxListTile;
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Zainstaluj apke mobilną banku'),
            value: _checkboxListTile,
            onChanged: (value) {
              setState(() {
                _checkboxListTile = !_checkboxListTile;
              });
            },
          ),
          Text("Liczba wykonanych tranzakcji"),
          SpinBox(
            min: 0,
            max: 10,
            value: 0,
            onChanged: (value) => print(value),
          )
        ],
      ),
    );
  }
}
