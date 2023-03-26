import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentFirebaseUser;

  static Future<dynamic> signUp({required String name,required String email,required String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      print('Auth登録完了');
      return true;
    }on FirebaseAuthException catch(e) {
      print('Auth登録エラー:$e');
      return false;
    }
}
  static Future<dynamic> emailSignIn({required String email,required String password}) async{
    try{
      final UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      currentFirebaseUser = result.user;
      print('authサインイン完了');
      return true;
    }on FirebaseAuthException catch(e) {
      print('authサインインエラー:$e');
      return false;
    }
  }
}