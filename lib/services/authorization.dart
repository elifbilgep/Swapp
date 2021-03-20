import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:takas/models/user.dart';

class Authorization {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String activeUserId;

  UserDetail _createUser(User user) {
    return user == null ? null : UserDetail.createFromFirebase(user);
  }

  Stream<UserDetail> get stateFollower {
    return _firebaseAuth.authStateChanges().map(_createUser);
  }

  createUserWithMail(String email, String password) async {
    var userCard = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _createUser(userCard.user); // turns a user object
  }

  signInWithMail(String email, String password) async {
    var userCard = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _createUser(userCard.user); // turns a user object
  }

  signOut() {
    return _firebaseAuth.signOut();
  }

  Future<UserDetail> signinWithGoogle() async {
    GoogleSignInAccount googleAcc = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleAuthCard = await googleAcc.authentication;
    AuthCredential loginWithoutPassword = GoogleAuthProvider.credential(
        idToken: googleAuthCard.idToken,
        accessToken: googleAuthCard.accessToken);
    var loginCard =
        await _firebaseAuth.signInWithCredential(loginWithoutPassword);
    print(loginCard.user.displayName);
    return _createUser(loginCard.user);
  }
}
