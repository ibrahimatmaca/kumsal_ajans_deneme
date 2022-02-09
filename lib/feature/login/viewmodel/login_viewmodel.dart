import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/model/base_view_model.dart';
import '../model/login_model.dart';
import '../service/firebase_service.dart';

class LoginViewModel extends BaseViewModel {
  late GlobalKey<FormState> formKey;
  late TextEditingController email;
  late TextEditingController password;

  bool hasInternet = false;

  late final _authService;

  late bool isConnectivityCheck;

  @override
  void init() {
    formKey = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    _authService = AuthService();
    internetConnectionChecker();
  }

  @override
  void setContext(BuildContext context) {}

  Future<void> internetConnectionChecker() async {
    InternetConnectionChecker().onStatusChange.listen((status) {
      final _hasInternet = status == InternetConnectionStatus.connected;
      this.hasInternet = _hasInternet;
      notifyListeners();
    });
  }

  Future<bool> loginFunction() async {
    if (formKey.currentState!.validate()) {
      try {
        final response = await _authService.signIn(UserModel(
          email: email.text.trim(),
          password: password.text.trim(),
        ));
        if (response != null) {
          debugPrint(response.email);
          email.clear();
          password.clear();
          return true;
        }
      } catch (e) {
        inspect(e);
      }
    }
    return false;
  }

  void registerFunction() async {
    if (formKey.currentState!.validate()) {
      try {
        final response = await _authService.createUser(
          UserModel(email: email.text.trim(), password: password.text.trim()),
        );
        if (response != null) {
          debugPrint("Success");
        }
      } catch (e) {
        inspect(e);
      }
    }
  }
}
