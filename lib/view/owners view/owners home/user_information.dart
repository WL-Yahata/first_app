import 'package:flutter/material.dart';

class UserInformationPage extends StatefulWidget {
  const UserInformationPage({Key? key}) : super(key: key);

  @override
  State<UserInformationPage> createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black45),
        centerTitle: true,
        title: const Text(
          'ユーザー情報',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
