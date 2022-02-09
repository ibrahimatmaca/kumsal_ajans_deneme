import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../login/view/login_view.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  final String homeTitle = 'Home Title';
  final String logout = 'Logout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(homeTitle),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          viewModel.getUserData();
          return homeColumn(viewModel, context);
        },
      ),
    );
  }

  Center homeColumn(HomeViewModel viewModel, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('${viewModel.currentUser.email}'),
          elevatedLogoutButton(viewModel, context)
        ],
      ),
    );
  }

  ElevatedButton elevatedLogoutButton(HomeViewModel viewModel, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          viewModel.logout().then((value) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginView()),
                (Route<dynamic> route) => false);
          });
        },
        child: Text(logout));
  }
}
