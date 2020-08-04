import 'package:auto_route/auto_route_annotations.dart';
import 'package:moberasweb/login/ui/login_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: LoginView, initial: true),
  ],
)
class $Router {}
