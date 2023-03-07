import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersTournamentPage extends StatefulWidget {
  const UsersTournamentPage({Key? key}) : super(key: key);

  @override
  State<UsersTournamentPage> createState() => _UsersTournamentPageState();
}

class _UsersTournamentPageState extends State<UsersTournamentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TournamentList',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
