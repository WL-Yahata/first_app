import 'package:first_app/view/users%20view/users%20order/users%20drink.dart';
import 'package:first_app/view/users%20view/users%20order/users%20food.dart';
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
      body: Column(
        children: [
          Row(
            children: [
              //↓drink
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsersDrink()),
                  );
                  // タップしたときの処理を記述
                },
                child:Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      margin: const EdgeInsets.all(0.0),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 210,
                      // 対象の画像を記述
                      child: Image.network(
                          'https://t3.ftcdn.net/jpg/03/39/84/02/360_F_339840249_BbLhICFLeCDEvJ6fr0WGvA7cStJP1Nu2.jpg'),
                    ),
                    Center(child: Text('drink'))
                  ],
                ),
              ),
              //↓food
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsersFood()),
                  );
                  // タップしたときの処理を記述
                },
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      margin: const EdgeInsets.all(0.0),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 210,
                      // 対象の画像を記述
                      child: Image.network(
                          'https://t4.ftcdn.net/jpg/02/86/17/89/240_F_286178925_8zk89O9uC5JJVPvqhvBMUpaRxp8AFXzD.jpg'
                      ),
                    ),
                    Center(child: Text('food'))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
