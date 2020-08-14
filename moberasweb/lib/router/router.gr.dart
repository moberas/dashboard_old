// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../activities/ui/activities_view.dart';
import '../login/ui/login_view.dart';
import '../pacient/ui/pacient_profile_view.dart';
import '../pacient/ui/pacient_view.dart';

class Routes {
  static const String loginView = '/';
  static const String pacientView = '/pacient-view';
  static const String pacientProfileView = '/pacient-profile-view';
  static const String activitiesView = '/activities-view';
  static const all = <String>{
    loginView,
    pacientView,
    pacientProfileView,
    activitiesView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.pacientView, page: PacientView),
    RouteDef(Routes.pacientProfileView, page: PacientProfileView),
    RouteDef(Routes.activitiesView, page: ActivitiesView),
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
    PacientProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PacientProfileView(),
        settings: data,
      );
    },
    ActivitiesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ActivitiesView(),
        settings: data,
      );
    },
  };
}
