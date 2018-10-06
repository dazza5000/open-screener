import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthUtil {

  static Future<String> getUserId() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();

    assert(user != null);
    assert(await user.getIdToken() != null);

    return user.uid;
  }

  static Future<FirebaseUser> handleSignInEmail(String email, String password) async {

    if (email.isEmpty || password.isEmpty) {
      return null;
    }

    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.signInWithEmailAndPassword(
        email: email, password: password);

    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    print('signInEmail succeeded: $user');

    return user;
  }

  Future<FirebaseUser> handleSignUp(email, password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    assert (user != null);
    assert (await user.getIdToken() != null);

    return user;
  }
}