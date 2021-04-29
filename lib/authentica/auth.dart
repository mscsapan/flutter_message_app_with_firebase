import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_messanger/model_class/user_auth_model.dart';

class Authenticate {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel _userModel(User user) {
    return user != null ? UserModel(userId: user.uid) : null;
  }

  Future<void> registerEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = credential.user;
      return _userModel(firebaseUser);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        print('password is too weak');
      } else if (error.code == 'email-already-in-use') {
        print('Email is already registered..');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> logInEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = credential.user;
      return _userModel(firebaseUser);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'wrong-password') {
        print('Wrong Password');
      } else if (error.code == 'user-not-found') {
        print('User does not exit or not registered');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> resetPassword(String email) async {
    return await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logOut() async {
    return await auth.signOut();
  }
}
