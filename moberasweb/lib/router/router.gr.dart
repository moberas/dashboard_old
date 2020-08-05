// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../login/ui/login_view.dart';
import '../pacient/ui/pacient_view.dart';

class Routes {
  static const String loginView = '/';
  static const String pacientView = '/pacient-view';
  static const all = <String>{
    loginView,
    pacientView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.pacientView, page: PacientView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    PacientView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PacientView(),
        settings: data,
      );
    },
  };
}
