import 'package:flutter/material.dart';

import '../model/karencja.dart';

class KarencjaDialog extends StatefulWidget {
  final Karencja karencja;
  final Function(String name, String data) onClickedDone;

  const KarencjaDialog({
    Key key,
    this.karencja,
    this.onClickedDone,
  }) : super(key: key);

  @override
  _KarencjaDialogState createState() => _KarencjaDialogState();
}

class _KarencjaDialogState extends State<KarencjaDialog> {
  final formKey = GlobalKey<FormState>();
  final nazwa = TextEditingController();
  final data = TextEditingController();

  bool isExpense = true;

  @override
  void initState() {
    super.initState();

    if (widget.karencja != null) {
      final karencja = widget.karencja;

      nazwa.text = karencja.nazwa;
      data.text = karencja.data;
    }
  }

  @override
  void dispose() {
    nazwa.dispose();
    data.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.karencja != null;
    final title = isEditing
        ? 'Edytuj date zamknięcia konta'
        : 'Dodaj adnotacje o zamknięciu konta';

    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8),
              buildName(),
              SizedBox(height: 8),
              buildDate(),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        buildCancelButton(context),
        buildAddButton(context, isEditing: isEditing),
      ],
    );
  }

  Widget buildName() => TextFormField(
        controller: nazwa,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Wpisz nazwe banku',
        ),
        validator: (name) =>
            name != null && name.isEmpty ? 'Wpisz nazwe banku' : null,
      );

  Widget buildDate() => TextFormField(
        controller: data,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Wpisz date zakończenia umowy',
        ),
        validator: (data) => data != null && data.isEmpty
            ? 'Wpisz date zakończenia umowy'
            : null,
      );

  Widget buildCancelButton(BuildContext context) => TextButton(
        child: Text('Anuluj'),
        onPressed: () => Navigator.of(context).pop(),
      );

  Widget buildAddButton(BuildContext context, {bool isEditing}) {
    final text = isEditing ? 'Zapisz' : 'Dodaj';

    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState.validate();

        if (isValid) {
          final name = nazwa.text;
          final data1 = data.text;

          widget.onClickedDone(name, data1);

          Navigator.of(context).pop();
        }
      },
    );
  }
}
