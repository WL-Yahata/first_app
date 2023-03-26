import 'package:cloud_firestore/cloud_firestore.dart';

class Account{
  String id;
  String name;
  String imagepath;
  String userId;
  Timestamp? createdTime;
  Timestamp? updatedTime;

  Account({this.id = '',this.name = '',this.imagepath = '',this.userId = '',
          this.createdTime,this.updatedTime});
}