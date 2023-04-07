import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  String id;
  String name;
  String content;
  String postAccountId;
 Timestamp? createdTime;

  Post({this.id = '',this.name = '',this.content = '',this.postAccountId = '',this.createdTime});
}