import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CalenderSet extends StatefulWidget {
  const CalenderSet({Key? key}) : super(key: key);

  @override
  State<CalenderSet> createState() => _CalenderSetState();
}

class _CalenderSetState extends State<CalenderSet> {
  String selectedTournament = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'トーナメントの設定',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text('トーナメント名'),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('TournamentData')
                      .snapshots(),
                  builder: (context, snapshot) {
                    List<DropdownMenuItem> tournamentItems = [];
                    if (!snapshot.hasData) {
                      const CircularProgressIndicator();
                    } else {
                      final TournamentDatas =
                          snapshot.data?.docs.reversed.toList();
                      tournamentItems.add(const DropdownMenuItem(
                          value: "0", child: Text('Select Tournament')));
                      for (var TournamentData in TournamentDatas!) {
                        tournamentItems.add(
                          DropdownMenuItem(
                            value: TournamentData.id,
                            child: Text(
                              TournamentData['tournamentName'],
                            ),
                          ),
                        );
                      }
                    }
                    return DropdownButton(
                      items: tournamentItems,
                      onChanged: (TournamentDataValue) {
                        setState(() {
                          selectedTournament = TournamentDataValue;
                        });
                        print(TournamentDataValue);
                      },
                      value: selectedTournament,
                      isExpanded: false,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
