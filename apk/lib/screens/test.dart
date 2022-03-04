// Container(
//         child: Center(
//           child: FutureBuilder(
//               future: DefaultAssetBundle.of(context)
//                   .loadString('assets/karencja.json'),
//               builder: (context, snapshot) {
//                 var new_data = json.decode(snapshot.data.toString());
//                 return ListView.builder(
//                   itemBuilder: (BuildContext context, int index) {
//                     return Card(
//                       child: Padding(
//                         padding: EdgeInsets.all(20.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: <Widget>[
//                             RichText(
//                               text: TextSpan(
//                                 style: const TextStyle(
//                                   fontSize: 18.0,
//                                   color: Colors.black,
//                                 ),
//                                 children: <TextSpan>[
//                                   TextSpan(text: 'Nazwa Banku: '),
//                                   TextSpan(
//                                       text: new_data[index]['name'],
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold)),
//                                 ],
//                               ),
//                             ),
//                             // Text("Nazwa Banku: " + new_data[index]['name']),
//                             // Text("cos"),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text("Data zamknięcia konta: " +
//                                 new_data[index]['data']),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                   itemCount: new_data == null ? 0 : new_data.length,
//                 );
//               }),
//         ),
//       ),