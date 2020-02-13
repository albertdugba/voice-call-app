import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;
      if (user != null) {
        print(user);
      }
    } catch (e) {
      print('Something went wrong. Failed to sign in $e');
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser signedInUser = result.user;
      if (signedInUser != null) {
        print('Welcome come back $signedInUser');
      }
    } catch (e) {
      print('Failed to sign in');
    }
  }
}
