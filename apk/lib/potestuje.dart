import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:aplikacja_do_promocji_bankowych/model/karencja.dart';

class Potestuje extends StatelessWidget {
  const Potestuje({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Hive.openBox<MyFavorite>('myFavorite'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ValueListenableBuilder<Box<MyFavorite>>(
                valueListenable: Hive.box<MyFavorite>('myFavorite').listenable(),
                builder: (context, box, _) {
                  final contacts = box.values.toList().cast<MyFavorite>();

                  return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (BuildContext context, int index) {
                      final contact = contacts[index];
                      return Column(
                        children: [
                          Text(contact.id.toString()),
                          Text(contact.isFavorite.toString()),
                          Text(contact.requirements.toString()),
                          Text(contact.bankName.toString()),
                          Text(contact.rewards.toString()),
                        ],
                      );
                      // ListTile(
                      //   title: Text(
                      //     contact.imie,
                      //   ),
                      //   subtitle: Text(
                      //     contact.nazwisko.toString(),
                      //   ),
                      //   trailing: IconButton(
                      //     icon: Icon(Icons.delete),
                      //     onPressed: () {
                      //       box.deleteAt(index);
                      //     },
                      //   ),
                      // );
                    },
                  );
                },
              );
            }
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
