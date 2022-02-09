import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:kumsal_ajans/feature/login/service/firebase_service.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final service = AuthService();

  late User currentUser;

  Future<void> getUserData() async {
    final User user = auth.currentUser!;
    currentUser = user;
  }

  Future<void> logout() async {
    await service.signOut();
  }
}
