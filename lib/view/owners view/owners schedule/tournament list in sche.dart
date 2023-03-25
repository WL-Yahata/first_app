import 'package:first_app/fireStore/tournament%20data.dart';
import 'package:first_app/model/Tournament_info.dart';
import 'package:first_app/view/owners%20view/owners%20schedule/add%20tournament%20in%20sche.dart';
import 'package:first_app/view/owners%20view/owners%20schedule/edit%20tournament%20in%20sche.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ScheTournamentList extends StatefulWidget {
  const ScheTournamentList({Key? key}) : super(key: key);

  @override
  State<ScheTournamentList> createState() => _ScheTournamentListState();
}

class _ScheTournamentListState extends State<ScheTournamentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'スケジュールの管理',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ScheAddTournament()));
        },
        backgroundColor: Colors.black45,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: TournamentDataFireStore.tournamentData.snapshots(),
          builder: (context, tournamentDataSnapshot) {
            if (tournamentDataSnapshot.hasData) {
              tournamentDataSnapshot.data!.docs.forEach((doc) {});
              return ListView.builder(
                itemCount: tournamentDataSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      tournamentDataSnapshot.data!.docs[index].data()
                          as Map<String, dynamic>;
                  TournamentDetail tournamentDetail = TournamentDetail(
                      tournamentName: data['tournamentName'],
                      whichReEntry: data['whichReEntry'],
                      addOnStack: data['addOnStack'],
                      timeOfBlind: data['timeOfBlind'],
                      startStack: data['entryStack'],
                      whichAddOn: data['whichAddOn'],
                      entryFee: data['entryFee'],
                      addOnFee: data['addOnFee'],
                      reEntryFee: data['reEntryFee']);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScheEditTournament()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: index == 0
                              ? const Border(
                                  top: BorderSide(color: Colors.grey, width: 0),
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 0),
                                )
                              : const Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 0),
                                )),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                tournamentDetail.tournamentName,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                '¥',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                tournamentDetail.entryFee,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const Text(
                                '/ReEntry',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                tournamentDetail.whichReEntry,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const Text(
                                '/AddON',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                tournamentDetail.addOnStack,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const Text(
                                '/stack',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                tournamentDetail.startStack,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const Text(
                                '/Blind',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                tournamentDetail.timeOfBlind,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
