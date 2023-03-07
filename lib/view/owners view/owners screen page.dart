import 'package:first_app/view/owners%20view/owners%20home/owners%20home.dart';
import 'package:first_app/view/owners%20view/owners%20order/owners%20order.dart';
import 'package:first_app/view/owners%20view/owners%20schedule/owners%20schedule%20page.dart';
import 'package:first_app/view/owners%20view/owners%20tournament/owners%20tournament.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnersScreenPage extends StatefulWidget {
  const OwnersScreenPage({Key? key}) : super(key: key);

  @override
  State<OwnersScreenPage> createState() => _OwnersScreenPageState();
}

class _OwnersScreenPageState extends State<OwnersScreenPage> {
  int selectedIndex = 0;
  List<Widget> pageList = [
    const OwnersHomePage(),
    const OwnersTournamentPage(),
    const OwnersOrderPage(),
    const OwnersSchedulePage(),
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
