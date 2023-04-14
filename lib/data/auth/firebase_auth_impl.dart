import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:news_mobile/core/constants/firebase_instances.dart';
import 'package:news_mobile/core/exception/firebase_exception_parser.dart';
import 'package:news_mobile/core/model/user.dart';
import 'package:news_mobile/data/auth/iauthentication.dart';

class FirebaseAuthImpl implements IAuthentication {
  @override
  Future<bool> changePassword(String newPassword) async {
    bool result = false;
    try {
      final user = authInstance.currentUser!;
      await user.updatePassword(newPassword);
      result = true;
    } on FirebaseAuthException catch (e) {
      parseFirebaseException(e.code);
    } catch (e) {
      throw Exception(e);
    }
    return result;
  }

  @override
  Future<User> logInWithEmail({
    required String email,
    required String password,
  }) async {
    late User user;
    try {
      final userCred = await authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      user = User(
        uid: userCred.user!.uid,
        email: userCred.user!.email!,
        name: userCred.user!.displayName!,
      );
    } on FirebaseAuthException catch (e) {
      parseFirebaseException(e.code);
    } catch (e) {
      throw Exception(e);
    }
    return user;
  }

  @override
  Future<bool> resetPassword(String email) async {
    try {
      await authInstance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      parseFirebaseException(e.code);
    } catch (e) {
      throw Exception(e);
    }
    return authInstance.currentUser != null;
  }

  @override
  Future<bool> signOut() async {
    bool result = false;
    try {
      await authInstance.signOut();
      await dbIntance.terminate();
      await dbIntance.clearPersistence();
      result = true;
    } catch (e) {
      throw Exception(e);
    }
    return result;
  }

  @override
  Future<User> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    late User user;
    try {
      final userCred = await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCred.user?.updateDisplayName(name);
      user = User(
        uid: userCred.user!.uid,
        email: userCred.user!.email!,
        name: userCred.user!.displayName!,
      );
    } on FirebaseAuthException catch (e) {
      parseFirebaseException(e.code);
    } catch (e) {
      throw Exception(e);
    }
    return user;
  }
}
