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

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'inny_detal_screeen.dart';

class MojePromocjeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('promocje').get();

    return Scaffold(
      appBar: AppBar(
        title: Text('Moje promocje'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: users,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Coś poszło nie tak");
          }

          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data.docs;
            return ListView(
                children: documents.map((doc) {
              DateTime dataZakonczenia = doc['Data zakonczenia'].toDate();
              String stringData = DateFormat('yMd').format(dataZakonczenia);
              return doc['ide'] == '1'
                  ? SizedBox()
                  : GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InnyDetalScreen()),
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
                                    // fit: BoxFit.fill,
                                  ),
                                ),
                                title: Text(doc['Tytul']),
                                subtitle: Text(stringData),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
            }).toList());
          }

          return Text("Ładowanie");
        },
      ),
    );
  }
}
