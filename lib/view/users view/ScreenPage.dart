import 'package:first_app/view/users%20view/users%20home/users%20home%20page.dart';
import 'package:first_app/view/users%20view/users%20order/users%20order%20page.dart';
import 'package:first_app/view/users%20view/users%20schedule/users%20schedule%20page.dart';
import 'package:first_app/view/users%20view/users%20tournament/users%20tournament%20page.dart';
import 'package:flutter/material.dart';

class UsersScreenPage extends StatefulWidget {
  const UsersScreenPage({Key? key}) : super(key: key);

  @override
  State<UsersScreenPage> createState() => _UsersScreenPageState();
}

class _UsersScreenPageState extends State<UsersScreenPage> {
  int selectedIndex = 0;
  List<Widget> pageList = [
    const UsersHomePage(),
    const UsersTournamentPage(),
    const UsersOrederPage(),
    const UsersSchedulePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black45,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.balance,
                color: Colors.black45,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bakery_dining,
                color: Colors.black45,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                color: Colors.black45,
              ),
              label: ''),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
