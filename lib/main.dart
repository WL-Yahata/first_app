import 'package:first_app/view/users%20view/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:local_auth/local_auth.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final CollectionReference _users = firestore.collection('users');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Future<void> addUser() async {
  // await _users.add({'PokerName': 'BirthDay'});
  // print('Userの追加完了');}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final auth = LocalAuthentication();
  Future<bool>canCheckLocalAuth() async {
    return await auth.canCheckBiometrics;
  }

  Future<List<BiometricType>>getAvailableBiometrics() async{
    return auth.getAvailableBiometrics();
  }

  Future<bool>authenticate() async{
    return await auth.authenticate(
        localizedReason: '生体認証を行います',
      options: const AuthenticationOptions(useErrorDialogs: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}

