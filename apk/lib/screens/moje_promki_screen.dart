// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MojePromocjeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users =
//         FirebaseFirestore.instance.collection('promocje');

//     return Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: users.doc('Korzystna premia').get(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("Something went wrong");
//           }

//           if (snapshot.hasData && !snapshot.data.exists) {
//             return Text("Document does not exist");
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data =
//                 snapshot.data.data() as Map<String, dynamic>;
//             print(snapshot.data);
//             return Text("${data['Opis promocji']}");
//           }

//           return Text("loading");
//         },
//       ),
//     );
//   }
// }

import 'package:aplikacja_do_promocji_bankowych/model/karencja.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/detale_prom_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class MojePromocjeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<QuerySnapshot> users = FirebaseFirestore.instance.collection('promocje').get();

    return Scaffold(
      appBar: AppBar(
        title: Text('Moje promocje'),
      ),
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
                    // shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: box.values.length,
                    itemBuilder: (BuildContext context, int index) {
                      final contact = contacts[index];
                      // print(contact.isFavorite);
                      return FutureBuilder<QuerySnapshot>(
                        future: users,
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text("Coś poszło nie tak");
                          }

                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents = snapshot.data.docs;
                            return ListView(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                children: documents.map((doc) {
                                  DateTime dataZakonczenia = doc['Data zakonczenia'].toDate();
                                  String stringData = DateFormat('yMd').format(dataZakonczenia);

                                  return doc['ide'] == contact.id.toString() && contact.isFavorite
                                      ? GestureDetector(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => DetaleScreen(doc)),
                                          ),
                                          child: Card(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  ListTile(
                                                    leading: Container(
                                                      width: 80,
                                                      child: Container(
                                                        child: Image.network(doc['Zdjęcie']),
                                                      ),
                                                    ),
                                                    title: Text(doc['Tytul']),
                                                    subtitle: Text(stringData),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox();
                                }).toList());
                          }
                          return Text("Ładowanie");
                        },
                      );
                    },
                  );
                },
              );
            }
          } else {
            return const Center(
              child: Text('Dodaj promocję do ulubionych'),
            );
          }
        },
      ),
    );
  }
}
