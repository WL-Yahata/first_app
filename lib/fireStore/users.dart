import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/model/Account.dart';
import 'package:first_app/utils/authentication.dart';

class UserFirestore{
  static final firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users = firestoreInstance.collection('users');

  static Future<dynamic> setUser(Account newAccount) async{
    try{
      await users.doc(newAccount.id).set({
        'name':newAccount.name,
        'imagepath':newAccount.imagepath,
        'createdtime':Timestamp.now(),
        'updatedtime':Timestamp.now(),
      });
      print('新規ユーザー作成完了');
      return true;
    }on FirebaseException catch(e){
      print('新規ユーザー作成エラー:$e');
      return false;
    }
  }
  static Future<dynamic> getUser(String uid)async{
    try{
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      Map<String,dynamic> data = documentSnapshot.data() as Map<String,dynamic>;
      Account myAccount = Account(
        id: uid,
        name: data['name'],
        imagepath: data['imagepath'],
        createdTime: data['createdtime'],
        updatedTime: data['updatedtime'],
      );
      Authentication.myAccount = myAccount;
      print('ユーザー取得完了');
      return true;
    }on FirebaseException catch(e){
      print('ユーザー取得エラー: $e');
      return false;
    }
  }
  static Future<Map<String, Account>?> getPostUserMap(List<String> accountIds) async{
    Map<String, Account> map = {};
    try{
      await Future.forEach(accountIds, (String accountId) async{
        var doc = await users.doc(accountId).get();
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Account postAccount = Account(
          id: accountId,
          name: data['name'],
          imagepath: data['image_path'],
          createdTime: data['created_time'],
          updatedTime: data['updated_time']
        );
        map[accountId] = postAccount;
      });
      print('投稿ユーザーの情報取得完了');
      return map;
    }on FirebaseException catch(e){
      print('投稿ユーザーの情報取得エラー,$e');
      return null;
    }
  }
}