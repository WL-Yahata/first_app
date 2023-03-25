import 'package:first_app/fireStore/tournament%20data.dart';
import 'package:first_app/model/Tournament_info.dart';
import 'package:flutter/material.dart';

class ScheAddTournament extends StatefulWidget {
  const ScheAddTournament({Key? key}) : super(key: key);

  @override
  State<ScheAddTournament> createState() => _ScheAddTournamentState();
}

class _ScheAddTournamentState extends State<ScheAddTournament> {
  TextEditingController tournamentNameController = TextEditingController();
  TextEditingController entryFeeController = TextEditingController();
  TextEditingController reEntryFeeController = TextEditingController();
  TextEditingController addOnFeeController = TextEditingController();
  TextEditingController whichReEntryController = TextEditingController();
  TextEditingController whichAddOnController = TextEditingController();
  TextEditingController entryStackController = TextEditingController();
  TextEditingController addOnStackController = TextEditingController();
  TextEditingController timeOfBlindController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'トーナメントの追加',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text('トーナメント名'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: tournamentNameController,
                decoration: const InputDecoration(hintText: 'トーナメント名'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('エントリー費'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: entryFeeController,
                decoration: const InputDecoration(hintText: 'エントリー費'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('エントリースタック'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: entryStackController,
                decoration: const InputDecoration(hintText: 'エントリースタック'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('リエントリー（あり/なし）'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: whichReEntryController,
                decoration: const InputDecoration(hintText: 'リエントリー（あり/なし）'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('リエントリー費'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: reEntryFeeController,
                decoration: const InputDecoration(hintText: 'リエントリー費'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('アドオン（あり/なし）'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: whichAddOnController,
                decoration: const InputDecoration(hintText: 'アドオン（あり/なし）'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('アドオン費'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: addOnFeeController,
                decoration: const InputDecoration(hintText: 'アドオン費'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('アドオンスタック'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: addOnStackController,
                decoration: const InputDecoration(hintText: 'アドオンスタック'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('ブラインドタイム'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: timeOfBlindController,
                decoration: const InputDecoration(hintText: 'ブラインドタイム'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (tournamentNameController.text.isNotEmpty &&
                      entryFeeController.text.isNotEmpty &&
                      entryStackController.text.isNotEmpty &&
                      whichReEntryController.text.isNotEmpty &&
                      reEntryFeeController.text.isNotEmpty &&
                      whichAddOnController.text.isNotEmpty &&
                      addOnFeeController.text.isNotEmpty &&
                      addOnStackController.text.isNotEmpty &&
                      timeOfBlindController.text.isNotEmpty) {
                    TournamentDetail newTournamentDetail = TournamentDetail(
                      tournamentName: tournamentNameController.text,
                      entryFee: entryFeeController.text,
                      whichReEntry: whichReEntryController.text,
                      reEntryFee: reEntryFeeController.text,
                      whichAddOn: whichAddOnController.text,
                      addOnFee: addOnFeeController.text,
                      startStack: entryStackController.text,
                      addOnStack: addOnStackController.text,
                      timeOfBlind: timeOfBlindController.text,
                    );
                    var result = await TournamentDataFireStore.setTournament(
                        newTournamentDetail);
                    if (result == true) {}
                    Navigator.pop(context);
                  }
                },
                child: const Text('Create'))
          ],
        ),
      )),
    );
  }
}
