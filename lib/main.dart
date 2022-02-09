import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/login/view/login_view.dart';
import 'products/app_provider.dart';
import 'products/constants/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ApplicationProvider.instance.providerItems],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ApplicationConstants.APP_NAME,
        theme: ThemeData.light(),
        home: const LoginView(),
      ),
    );
  }
}
