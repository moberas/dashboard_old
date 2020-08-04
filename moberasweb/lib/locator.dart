import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:moberasweb/locator.config.dart';

final locator = GetIt.instance;

@injectableInit
Future<void> setupLocator() async => $initGetIt(locator);
