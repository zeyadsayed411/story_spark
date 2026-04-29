import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:story_spark/data/models/user_model.dart';
import 'package:story_spark/network/result_firebase.dart';

class AuthService {
  static CollectionReference<UserModel> get _getCollection {
    return FirebaseFirestore.instance
        .collection(UserModel.collection)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (userData, _) => userData.toJson(),
        );
  }

  static Future<void> addUser(UserModel user) async {
    try {
      await _getCollection.doc(user.id).set(user);
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  }

  static Future<ResultFB<UserModel>> registerUser(UserModel user) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email ?? "",
            password: user.password ?? "",
          );
      final token = credential.user?.uid;
      user.id = token ?? "";
      await addUser(user);
      return SucessFB(data: user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ErrorFB('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ErrorFB('The account already exists for that email.');
      } else {
        return ErrorFB(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      return ErrorFB(e.toString());
    }
  }

  static Future<ResultFB<UserCredential>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return SucessFB(data: credential);
    } catch (e) {
      return ErrorFB(e.toString());
    }
  }
}
