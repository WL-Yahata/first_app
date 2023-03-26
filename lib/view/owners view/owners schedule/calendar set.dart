import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CalenderSet extends StatefulWidget {
  const CalenderSet({Key? key}) : super(key: key);

  @override
  State<CalenderSet> createState() => _CalenderSetState();
}

class _CalenderSetState extends State<CalenderSet> {
  String selectedTournament = "0";
  String initMonth = DateTime.now().month.toString().padLeft(2, '0');
  String initDay = DateTime.now().day.toString().padLeft(2, '0');
  String inityear = DateTime.now().year.toString();

  List<String> monthList() {
    final month = <String>[
      '01',
      '02',
      '03',
      '04',
      '05',
      '06',
      '07',
      '08',
      '09',
      '10',
      '11',
      '12'
    ];
    return month;
  }

  List<String> dayThirtyOne() {
    final day = <String>[
      '01',
      '02',
      '03',
      '04',
      '05',
      '06',
      '07',
      '08',
      '09',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31'
    ];
    return day;
  }

  List<String> yearTen() {
    final year = <String>[
      '2023',
      '2024',
      '2025',
      '2026',
      '2027',
      '2028',
      '2029',
      '2030',
      '2031',
      '2032',
      '2033',
    ];
    return year;
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('年'),
                  Text('月'),
                  Text('日'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: inityear,
                    items: yearTen()
                        .map((list) =>
                            DropdownMenuItem(value: list, child: Text(list)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        inityear = value!;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: initMonth,
                    items: monthList()
                        .map((list) =>
                            DropdownMenuItem(value: list, child: Text(list)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        initMonth = value!;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: initDay,
                    items: dayThirtyOne()
                        .map((list) =>
                            DropdownMenuItem(value: list, child: Text(list)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        initDay = value!;
                      });
                    },
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Text(selectedTournament),
                    Text(inityear),
                    Text(initMonth),
                    Text(initDay),
                    Text('010')
                  ],
                ),
              ), //debug用に作ったもの「selectedTournament」が変数でこれを日付と共にfirestoreに入れる
            ],
          ),
        ),
      ),
    );
  }
}
