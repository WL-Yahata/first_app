import 'package:first_app/view/owners%20view/owners%20order/owners%20drink.dart';
import 'package:first_app/view/owners%20view/owners%20order/owners%20food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class OwnersOrderPage extends StatefulWidget {
  const OwnersOrderPage({Key? key}) : super(key: key);

  @override
  State<OwnersOrderPage> createState() => _OwnersOrderPageState();
}

class _OwnersOrderPageState extends State<OwnersOrderPage> {
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
                        builder: (context) => const OwnersDrink()),
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
                        builder: (context) => const OwnersFood()),
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
