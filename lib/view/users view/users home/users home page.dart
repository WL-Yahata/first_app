import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/model/Account.dart';
import 'package:first_app/utils/authentication.dart';
import 'package:first_app/view/owners%20view/owners%20screen%20page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/Post.dart';


class UsersHomePage extends StatefulWidget {
  const UsersHomePage({Key? key}) : super(key: key);

  @override
  State<UsersHomePage> createState() => _UsersHomePageState();
}

class _UsersHomePageState extends State<UsersHomePage> {
  Account myAccount = Authentication.myAccount!;

  DateTime parseTime(dynamic date) {
    return Platform.isIOS ? (date as Timestamp).toDate() : (date as DateTime);
  }

  List<Post> postList = [
    Post(name:'',content: 'ヤッホ', createdTime: Timestamp.now()),
    Post(name:'',content: 'は〜い', createdTime: Timestamp.now()),
    Post(name:'',content: 'ヤッホー', createdTime: Timestamp.now()),
    Post(name:'',content: 'は〜い', createdTime: Timestamp.now()),
  ];

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
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(2.0),
                margin: const EdgeInsets.only(
                  top: 50.0,
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
                    Container(
                      //QRコード
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(
                          top: 0.0,
                          bottom: 0.0,
                          right: 0.0,
                          left: 5.0,
                        ),
                        width: MediaQuery.of(context).size.width * 0.21,
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                        )),
                    //QRコード
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
                          Container(), //店のアイコン画像
                          Container(
                            //ptの表示

                            padding: const EdgeInsets.all(0.0),
                            margin: const EdgeInsets.all(0.0),
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 80,
                            decoration: const BoxDecoration(

                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: const [
                                    Text('    play money 1       '),

                                    Text('pt.'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Text('    play money 2       '),

                                    Text('pt.'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Text('    play money 3       '),

                                    Text('pt.'),
                                  ],
                                ),
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

          child: ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
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
                    const CircleAvatar(
                      radius: 22,
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
                                postList[index].name.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(DateFormat('M/d/yyyy')
                                  .format(postList[index].createdTime!.toDate()))
                            ],
                          ),
                          Text(postList[index].content)
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
          ], //追記：Columnの中のchildren
        ),
      ),
    );
  }
}

