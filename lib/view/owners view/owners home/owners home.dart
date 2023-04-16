import 'package:first_app/view/owners%20view/owners%20home/postpage.dart';
import 'package:first_app/view/owners%20view/owners%20home/qr_scan.dart';
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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black45),
        centerTitle: true,
        title: const Text(
          'home',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
          actions: [
            IconButton(
              icon: const Icon(Icons.qr_code),
              color: Colors.grey,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const QrScanPage()));
              },
            )
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PostPage()));
        },
        child: const Icon(Icons.chat_bubble_outline),
      )
    );
  }
}
