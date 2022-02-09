import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../feature/home/viewmodel/home_viewmodel.dart';
import '../feature/login/viewmodel/login_viewmodel.dart';

class ApplicationProvider {
  static final ApplicationProvider instance = ApplicationProvider._init();
  ApplicationProvider._init();

  List<SingleChildWidget> providerItems = [
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => HomeViewModel()),
  ];
}
