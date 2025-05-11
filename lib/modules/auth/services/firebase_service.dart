import 'package:firebase_auth/firebase_auth.dart';

class FireBaseService {
  static Future<UserCredential?> createAccount(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await credential.user?.updateDisplayName(name);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');

        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');

        throw 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<UserCredential?> login(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } catch (e) {
      throw "Invalid email or password";
    }
  }

  static Future<void> resetPassword(String email)async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    }catch(e){
      rethrow;
    }
  }
}
