import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/fireStore/posts.dart';
import 'package:first_app/fireStore/users.dart';
import 'package:first_app/model/Account.dart';
import 'package:first_app/utils/authentication.dart';
import 'package:first_app/view/owners%20view/owners%20screen%20page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../model/Post.dart';


class UsersHomePage extends StatefulWidget {
  const UsersHomePage({Key? key}) : super(key: key);

  @override
  State<UsersHomePage> createState() => _UsersHomePageState();
}

class _UsersHomePageState extends State<UsersHomePage> {


  DateTime parseTime(dynamic date) {
    return Platform.isIOS ? (date as Timestamp).toDate() : (date as DateTime);
  }
Account myAccount = Account(
  name: Authentication.myAccount!.name,
  imagepath: Authentication.myAccount!.imagepath,
);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OwnersScreenPage()),
              );
            },
            child: const Text('owners')),
      ),
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black45),
        centerTitle: true,
        title: const Text(
          'home',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //QRコード
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),

                child: QrImage(
                  data:UserFirestore.users  as String,
                  size: 120,
                  backgroundColor: Colors.white,
                ),
            ),
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(2.0),
                margin: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 40.0,
                  right: 10.0,
                  left: 10.0,
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      //店舗画像
                      radius: 40,
                      backgroundImage: NetworkImage('https://casino-deck.com/wp-content/uploads/2021/02/WP-ichatch-leje.png'),
                    ),
                    //店舗画像
                    Container(
                      //店のアイコン画像とpt表示とID・名前
                      padding: const EdgeInsets.all(0.0),
                      margin: const EdgeInsets.all(0.0),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 210,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            //ptの表示
                            padding: const EdgeInsets.all(0.0),
                            margin: const EdgeInsets.all(0.0),
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 80,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                          Text('  　  Prize     '),
                                      SizedBox(
                                        height: 5,
                                      ),
                                          Text('   　 Sponsored     '),
                                      SizedBox(
                                        height: 5,
                                      ),
                                          Text('  　  Sidegame Chips   '),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  width: MediaQuery.of(context).size.width * 0.2,

                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                          Text(' 10000'),
                                       SizedBox(
                                        height: 5,
                                      ),
                                          Text(' 10000'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                          Text(' 10000'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ), //ptの表示の
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.all(0.0),
                            margin: const EdgeInsets.all(0.0),
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 38,
                            decoration: const BoxDecoration(
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:  [
                               const Text(' PokerName: '),
                                Text(myAccount.name),
                              ],
                            ),
                          ), //名前・IDの
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              //投稿ページ
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  right: 0.0,
                  left: 0.0,
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),

          child: StreamBuilder<QuerySnapshot>(
            stream: PostFirestore.posts.snapshots(),
            builder: (context, postSnapshot) {
              if(postSnapshot.hasData) {
                List<String> postAccountIds = [];
                for (var doc in postSnapshot.data!.docs) {
                  Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                  if(postAccountIds.contains(data['post_account_id'])) {
                    postAccountIds.add(data['post_account_id']);
                  }
                }
                return FutureBuilder<Map<String, Account>?>(
                  future: UserFirestore.getPostUserMap(postAccountIds),
                  builder: (context, userSnapshot) {
                    if(userSnapshot.hasData && userSnapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        itemCount: postSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data = postSnapshot.data!.docs[index].data() as Map<String, dynamic>;
                          Post post = Post(
                            id:postSnapshot.data!.docs[index].id,
                            content: data['content'],
                            postAccountId: data['post_account_id'],
                            createdTime: data['created_time']
                          );
                          return Container(
                            decoration: BoxDecoration(
                                border: index == 0
                                    ? const Border(
                                  top: BorderSide(
                                      color: Colors.black45, width: 0),
                                  bottom: BorderSide(
                                      color: Colors.black45, width: 0),
                                )
                                    : const Border(
                                  bottom: BorderSide(
                                      color: Colors.black45, width: 0),
                                )),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              children: [
                                 CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(myAccount.imagepath),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            post.name.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(DateFormat('M/d/yyyy')
                                              .format(post.createdTime!.toDate()))
                                        ],
                                      ),
                                      Text(post.content)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }else {
                      return Container();
                    }

                  }
                );
              }else {
                return Container();
              }

            }
          )),
          ], //追記：Columnの中のchildren
        ),
      ),
    );
  }
}

