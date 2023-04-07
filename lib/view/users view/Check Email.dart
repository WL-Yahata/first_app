import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/fireStore/users.dart';
import 'package:first_app/utils/authentication.dart';
import 'package:first_app/view/users%20view/ScreenPage.dart';
import 'package:flutter/material.dart';

class CheckEmailPage extends StatefulWidget {
  final String email;
  final String password;
  const CheckEmailPage({super.key, required this.email, required this.password});

  @override
  State<CheckEmailPage> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black45),
        title: const Text('メールアドレスの確認',
            style: TextStyle(
              color: Colors.black45,
            )),
        centerTitle: true,
      ),
      body: Column(
        children:  [
          const Text('登録いただいたメール宛に確認のメールを送信しております。そちらに記載されているURLをクリックして認証をお願いします。'),
          ElevatedButton(
              onPressed: () async{
                var result = await Authentication.emailSignIn(email: widget.email, password: widget.password);
                if(result is UserCredential) {
                  if(result.user!.emailVerified == true) {
                    // ignore: use_build_context_synchronously
                    while(Navigator.canPop(context)) {
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
                    await UserFirestore.getUser(result.user!.uid);
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UsersScreenPage()));
                  }
                  else {
                    print('メール認証が終わっていません。');
                  }
                }
          },
              child: const Text('認証完了')
          )
        ],
      ),
    );
  }
}
