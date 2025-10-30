import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';


class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    UserModel user = UserModel(
      id: credential.user!.uid,
      name: name,
      email: email,
      password: password,
      favList: [],
    );

    await _firestore.collection('users').doc(user.id).set(user.toMap());
    return user;
  }

  Future<UserModel> signIn(String email, String password) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    DocumentSnapshot doc =
    await _firestore.collection('users').doc(credential.user!.uid).get();

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }


  Future<UserModel?> getCurrentUser() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return null;

    DocumentSnapshot doc =
    await _firestore.collection('users').doc(currentUser.uid).get();

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }


  Future<void> updateFavList(String userId, List<String> favList) async {
    await _firestore.collection('users').doc(userId).update({
      'favList': favList,
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
