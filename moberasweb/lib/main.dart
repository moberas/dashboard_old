import 'package:flutter/material.dart';
import 'package:moberasweb/commons/logger.dart';
import 'package:moberasweb/locator.dart';
import 'package:moberasweb/router/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLogger();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mobEras DASHBOARD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: Routes.loginView,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
