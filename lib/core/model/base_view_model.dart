import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BuildContext? context;
  //ICoreDio coreDio = NetworkManager.instance.coreDio;
  void setContext(BuildContext context);
  void init();
}
