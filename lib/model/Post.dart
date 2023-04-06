import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  String name;
  String content;
  String postAccountId;
 Timestamp? createdTime;

  Post({this.name = '',this.content = '',this.postAccountId = '',this.createdTime});
}