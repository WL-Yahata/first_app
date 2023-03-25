import 'package:cloud_firestore/cloud_firestore.dart';

import '../../main.dart';
import '../model/Tournament_info.dart';

class TournamentDataFireStore {
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference tournamentData =
      firestore.collection('TournamentData');

  static Future<dynamic> setTournament(
      TournamentDetail newTournamentDetail) async {
    try {
      await tournamentData.doc(newTournamentDetail.tournamentName).set({
        'tournamentName': newTournamentDetail.tournamentName,
        'entryFee': newTournamentDetail.entryFee,
        'whichReEntry': newTournamentDetail.whichReEntry,
        'entryStack': newTournamentDetail.startStack,
        'reEntryFee': newTournamentDetail.reEntryFee,
        'whichAddOn': newTournamentDetail.whichAddOn,
        'addOnFee': newTournamentDetail.addOnFee,
        'addOnStack': newTournamentDetail.addOnStack,
        'timeOfBlind': newTournamentDetail.timeOfBlind,
      });
      print('新規トーナメント作成完了');
      return true;
    } on FirebaseException catch (e) {
      print('新規トーナメント作成エラー:$e');
      return false;
    }
  }
}
