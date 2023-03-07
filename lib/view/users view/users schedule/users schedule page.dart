import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersSchedulePage extends StatefulWidget {
  const UsersSchedulePage({Key? key}) : super(key: key);

  @override
  State<UsersSchedulePage> createState() => _UsersSchedulePageState();
}

class _UsersSchedulePageState extends State<UsersSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'schedule',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
