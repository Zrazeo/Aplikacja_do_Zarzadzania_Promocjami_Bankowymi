// import 'package:flutter/material.dart';

// import 'package:aplikacja_do_promocji_bankowych/screens/moje_promki_screen.dart';
// import 'package:aplikacja_do_promocji_bankowych/screens/detale_prom_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PromScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Future<QuerySnapshot> promocje =
//         FirebaseFirestore.instance.collection('promocje').get();
// return Scaffold(
//   appBar: AppBar(
//     centerTitle: true,
//     title: const Text('Promocje'),
//   ),
// drawer: Drawer(
//   child: ListView(
//     padding: EdgeInsets.zero,
//     children: <Widget>[
//       DrawerHeader(
//         decoration: BoxDecoration(
//           color: Colors.blue,
//         ),
//         child: Text(
//           'Aplikacja do zarządzania promocjami bankowymi',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 23,
//           ),
//         ),
//       ),
//           ListTile(
//             leading: Icon(Icons.bar_chart),
//             title: Text('Statystyki'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => StatScreen()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.timelapse),
//             title: Text('Karencja'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => KarencjaScreen()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.list),
//             title: Text('Moje promocje'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PromScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//     ),

//       body: Column(
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => DetaleScreen()),
//               );
//             },
//             child: Column(
//               children: [
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         ListTile(
//                           leading: Container(
//                             width: 80,
//                             child: Container(
//                               child: Image.network(
//                                   'https://przyjaznebanki.pl/wp-content/uploads/2019/06/Jak-otworzy%C4%87-konto-w-ING-Bank-%C5%9Al%C4%85ski.jpg'),
//                               // fit: BoxFit.fill,
//                             ),
//                           ),
//                           title: Text(
//                               'Jakaś bik nagrona piniendzy gdzie do wygrania masz naprawde dzuo kaski'),
//                           subtitle: Text('Data zakończenia promocji'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:aplikacja_do_promocji_bankowych/widget/drawer.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/detale_prom_screen.dart';


class PromScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('promocje').get();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Promocje'),
      ),
      drawer: Panel(),
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
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => 
                              // doc['ide'] == '1'
                                  // ?
                                  DetaleScreen(doc)
                                  // : InnyDetalScreen()
                                  ),
                        ),
                        child: ListTile(
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
                      ),
                    ],
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
