import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersOrederPage extends StatefulWidget {
  const UsersOrederPage({Key? key}) : super(key: key);

  @override
  State<UsersOrederPage> createState() => _UsersOrederPageState();
}

class _UsersOrederPageState extends State<UsersOrederPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'order',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
    ;
  }
}
