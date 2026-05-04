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
      print("Starting registration for: ${user.email}");
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email ?? "",
            password: user.password ?? "",
          )
          .timeout(const Duration(seconds: 10));
          
      final token = credential.user?.uid;
      user.id = token ?? "";
      
      print("User created in Auth, now adding to Firestore...");
      await addUser(user).timeout(const Duration(seconds: 10));
      
      print("Registration complete!");
      return SuccessFB(data: user);
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.code}");
      if (e.code == 'weak-password') {
        return ErrorFB('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ErrorFB('The account already exists for that email.');
      } else {
        return ErrorFB(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      print("General Registration Error: $e");
      return ErrorFB(e.toString());
    }
  }

  static Future<ResultFB<UserCredential>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      print("Starting login for: $email");
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .timeout(const Duration(seconds: 10));
      print("Login successful!");
      return SuccessFB(data: credential);
    } catch (e) {
      print("Login Error: $e");
      return ErrorFB(e.toString());
    }
  }
}
