import 'package:moberasweb/auto_route_annotations.dart';
import 'package:moberasweb/login_view.dart';
import 'package:moberasweb/main.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: MyApp, initial: true),
    MaterialRoute(
      page: MyApp,
    ),
    MaterialRoute(
      page: LoginView,
    ),
  ],
)
class $Router {}
