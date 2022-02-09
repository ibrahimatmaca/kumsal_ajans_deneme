import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kumsal_ajans/feature/login/model/login_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<User?> signIn(UserModel model) async {
    var user = await _auth.signInWithEmailAndPassword(email: model.email, password: model.password);
    return user.user;
  }

  //çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  //kayıt ol fonksiyonu
  Future<User?> createUser(UserModel model) async {
    var user =
        await _auth.createUserWithEmailAndPassword(email: model.email, password: model.password);

    await _firestore.collection("Users").doc(user.user!.uid).set({'email': model.email});

    return user.user;
  }
}
