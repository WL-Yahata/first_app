import 'package:cloud_firestore/cloud_firestore.dart';

class Account{
  int? pt;
  String id;
  String name;
  String imagepath;
  Timestamp? createdTime;
  Timestamp? updatedTime;

  Account({this.id = '',this.name = '',this.imagepath = '',
          this.createdTime,this.updatedTime,this.pt});
}