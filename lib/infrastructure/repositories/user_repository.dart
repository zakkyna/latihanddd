import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<UserCredential> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<User?> signUp(String email, String password, String name) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    await user?.updateDisplayName(name);
    return user;
  }

  Future signOut() async {
    await Future.wait([
      _firebaseAuth.signOut(),
    ]);
    return;
  }

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

  User getUser() {
    return _firebaseAuth.currentUser!;
  }

  Future resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return;
  }
}
