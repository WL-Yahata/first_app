import 'package:first_app/view/owners%20view/owners%20screen%20page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersHomePage extends StatefulWidget {
  const UsersHomePage({Key? key}) : super(key: key);

  @override
  State<UsersHomePage> createState() => _UsersHomePageState();
}

class _UsersHomePageState extends State<UsersHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: TextButton(
            onPressed: () {
              // ここにボタンを押した時に呼ばれるコードを書く
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
    );
  }
}
