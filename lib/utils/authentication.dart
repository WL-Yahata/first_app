import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentFirebaseUser;

  static Future<dynamic> signUp({required String name,required String email,required String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      print('Auth登録完了');
      return true;
    }on FirebaseAuthException  {
      print('Auth登録エラー');
      return false;
    }
}
}