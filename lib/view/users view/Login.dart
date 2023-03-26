import 'package:first_app/view/users%20view/CreateAccount.dart';
import 'package:first_app/view/users%20view/ScreenPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 50,),
              const Text('店舗名',style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'メールアドレス'
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passController,
                  decoration: const InputDecoration(
                      hintText: 'パスワード'
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                  text:  TextSpan(
                    style: const TextStyle(color: Colors.black45),
                    children: [
                      const TextSpan(text: 'アカウントを作成していない方は'),
                      TextSpan(text: 'こちら',
                      style:const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccount()));
                        }
                      ),
                    ]
                  )
              ),
              const SizedBox(height: 70),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UsersScreenPage()));
              }, child: const Text('ログイン'))
            ],
          ),
        ),
      ),
    );
  }
}