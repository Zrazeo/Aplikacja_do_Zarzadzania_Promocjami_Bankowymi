import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:aplikacja_do_promocji_bankowych/model/karencja.dart';

class WymogiTestowe extends StatefulWidget {
  const WymogiTestowe({Key key}) : super(key: key);

  @override
  State<WymogiTestowe> createState() => _WymogiTestoweState();
}

class _WymogiTestoweState extends State<WymogiTestowe> {
  bool test = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wymogi'),
        centerTitle: true,
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
                    itemCount: box.values.length,
                    itemBuilder: (BuildContext context, int index) {
                      final contact = contacts[index];
                      List requirementsMonthList = contact.requirements.keys.toList();
                      List rewardsMonthList = contact.rewards.keys.toList();

                      return contact.isFavorite
                          ? Column(
                              children: [
                                Text(contact.bankName.toString()),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: contact.requirements.length,
                                  itemBuilder: (BuildContext context, int ide) {
                                    List reqName = contact.requirements[requirementsMonthList[ide]].keys.toList();

                                    return Column(
                                      children: [
                                        Text(requirementsMonthList[ide]),
                                        ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: reqName.length,
                                          itemBuilder: (BuildContext context, int id) {
                                            // bool test = contact.requirements[requirementsMonthList[ide]][reqName[id]];

                                            // print(test);
                                            return Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment
                                              //         .spaceBetween,

                                              children: [
                                                // Text(reqName[id]),
                                                // Text(contact.requirements[
                                                //         requirementsMonthList[
                                                //             ide]][reqName[id]]
                                                //     .toString()),
                                                SizedBox(
                                                  width: width,
                                                  child: CheckboxListTile(
                                                      title: Text(reqName[id]),
                                                      value: //test,
                                                          contact.requirements[requirementsMonthList[ide]][reqName[id]],
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          test = value;
                                                        });
                                                      }),
                                                )
                                                // Text(ide.toString()),
                                                // Text(contact
                                                //     .rewards[rewardsMonthList[id]]
                                                //     .toString()),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                    // return Text(
                                    //   contact.requirements[
                                    //           requirementsMonthList[ide]]
                                    //       .toString(),
                                    // );
                                  },
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: contact.rewards.length,
                                  itemBuilder: (BuildContext context, int id) {
                                    return Row(
                                      children: [
                                        Text(rewardsMonthList[id]),
                                        Text(contact.rewards[rewardsMonthList[id]].toString()),
                                      ],
                                    );
                                  },
                                ),
                                // Text(contact.requirements.toString()),
                                // Text(contact.rewards.toString()),
                                SizedBox(height: 20)
                              ],
                            )
                          : SizedBox();
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
