import 'package:first_app/view/owners%20view/owners%20home/postpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnersHomePage extends StatefulWidget {
  const OwnersHomePage({Key? key}) : super(key: key);

  @override
  State<OwnersHomePage> createState() => _OwnersHomePageState();
}

class _OwnersHomePageState extends State<OwnersHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PostPage()));
        },
        child: const Icon(Icons.chat_bubble_outline),
      )
    );
  }
}
