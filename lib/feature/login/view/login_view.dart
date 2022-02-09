import 'package:flutter/material.dart';

import '../../../core/view/base_view.dart';
import '../../../products/extension/decoration_extension.dart';
import '../../../products/extension/padding_extension.dart';
import '../../../products/validator.dart';
import '../../home/view/home_view.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String loginTitle = 'Login';

  final String signIn = 'Sign In';

  final String signUp = 'Sign Up';

  late LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(loginTitle),
          ),
          body: viewModel.hasInternet
              ? Padding(
                  padding: context.allEdgeLowValue,
                  child: returnForm(context),
                )
              : const Center(
                  child: Text("İnternet Yok"),
                ),
        );
      },
    );
  }

  Widget returnForm(BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          emailTextFormField(context),
          const SizedBox(height: 15),
          passwordTextFormField(context),
          rowForButtons(context)
        ],
      ),
    );
  }

  TextFormField passwordTextFormField(BuildContext context) {
    return TextFormField(
      controller: viewModel.password,
      obscureText: true,
      validator: (value) => FieldValidator.instance.passwordValidator(value),
      decoration: context.decorationOutline,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  TextFormField emailTextFormField(BuildContext context) {
    return TextFormField(
      controller: viewModel.email,
      decoration: context.decorationOutline,
    );
  }

  Row rowForButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ElevatedButton(
            onPressed: () async {
              viewModel.loginFunction().then((value) {
                if (value) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const HomeView()),
                      (Route<dynamic> route) => false);
                }
              });
            },
            child: Text(signIn)),
        ElevatedButton(
            onPressed: () {
              viewModel.registerFunction();
            },
            child: Text(signUp)),
      ],
    );
  }
}
