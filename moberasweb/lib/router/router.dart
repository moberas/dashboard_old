import 'package:auto_route/auto_route_annotations.dart';
import 'package:moberasweb/login/ui/login_view.dart';
import 'package:moberasweb/pacient/ui/pacient_profile_view.dart';
import 'package:moberasweb/pacient/ui/pacient_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: LoginView, initial: true),
    MaterialRoute(page: PacientView),
    MaterialRoute(page: PacientProfileView),
  ],
)
class $Router {}
