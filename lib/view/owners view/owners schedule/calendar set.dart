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
  String initYear = DateTime.now().year.toString();
  String initStartHours = '12';
  String initStartMinutes = '00';
  String initEndHours = '12';
  String initEndMinutes = '00';

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

  List<String> hoursList() {
    final hours = <String>[
      '00',
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
    ];
    return hours;
  }

  List<String> minutesList() {
    final minutes = <String>[
      '00',
      '05',
      '10',
      '15',
      '20',
      '25',
      '30',
      '35',
      '40',
      '45',
      '50',
      '55',
    ];
    return minutes;
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                          value: "0", child: Text('トーナメントを選択')));
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
                    value: initYear,
                    items: yearTen()
                        .map((list) =>
                            DropdownMenuItem(value: list, child: Text(list)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        initYear = value!;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('スタート時刻'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: initStartHours,
                    items: hoursList()
                        .map((list) =>
                            DropdownMenuItem(value: list, child: Text(list)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        initStartHours = value!;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: initStartMinutes,
                    items: minutesList()
                        .map((list) =>
                            DropdownMenuItem(value: list, child: Text(list)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        initStartMinutes = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('レジスト時刻'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: initEndHours,
                    items: hoursList()
                        .map((list) =>
                            DropdownMenuItem(value: list, child: Text(list)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        initEndHours = value!;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: initEndMinutes,
                    items: minutesList()
                        .map((list) =>
                            DropdownMenuItem(value: list, child: Text(list)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        initEndMinutes = value!;
                      });
                    },
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Text(selectedTournament),
                    Text(
                        '$initDay/$initMonth/$initYear $initStartHours:$initStartMinutes:00'),
                    Text(
                        '$initDay/$initMonth/$initYear $initEndHours:$initEndMinutes:00'),
                  ],
                ),
              ), //debug用に作ったもの「selectedTournament」が変数でこれを日付と共にfirestoreに入れる
              ElevatedButton(
                child: const Text('予定を追加'),
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('CalendarAppointmentCollection') // コレクションID
                      .doc() // ドキュメントID
                      .set({
                    'Subject': selectedTournament,
                    'StartTime':
                        '$initDay/$initMonth/$initYear $initStartHours:$initStartMinutes:00',
                    'EndTime':
                        '$initDay/$initMonth/$initYear $initEndHours:$initEndMinutes:00'
                  }); // データ
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
