import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_sample1/core/constants/firebase_constants.dart';
import 'package:riverpod_sample1/core/providers/firebase_providers.dart';
import 'package:riverpod_sample1/failure.dart';
import 'package:riverpod_sample1/models/user_model.dart';
import 'package:riverpod_sample1/type_defs.dart';

import '../../../core/constants/constants.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider)));

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _auth = auth,
        _googleSignIn = googleSignIn,
        _firestore = firestore;
  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);
  FutureEither<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
       UserModel userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            name: userCredential.user!.displayName ?? '',
            profilePic:
                userCredential.user!.photoURL ?? Constants.avatarDefault,
            uid: userCredential.user!.uid ?? '',
            banner: Constants.bannerDefault,
            isAuthenticated: true,
            karma: 0,
            awards: []);
        await _users.doc(userModel.uid).set(userModel.toMap());
      }
      else{
        userModel=await getUserData(userCredential.user!.uid).first;
      }
      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
  Stream<UserModel> getUserData(String uid){
    return _users.doc(uid).snapshots().map((event) => UserModel.fromMap(event.data() as Map<String,dynamic>));
  }
}
