import 'package:flutter/material.dart';
import 'package:moberasweb/base_view_model.dart';
import 'package:pedantic/pedantic.dart';
import 'authentication_service.dart';
import 'locator.dart';
import 'validators.dart';

class LoginViewModel extends BaseViewModel with Validators {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  //final DialogService _dialogService = locator<DialogService>();
  //final NavigationService _navigationService = locator<NavigationService>();
  //final AnalyticsService _analyticsService = locator<AnalyticsService>();
  //final SnackbarService _snackbarService = locator<SnackbarService>();

  /*Future checkSignInResult(result) async {
    if (result is bool) {
      if (result) {
        await _analyticsService.logLogin('email');
        unawaited(_navigationService
            .pushNamedAndRemoveUntil(Routes.startupViewRouter));
      } else {
        await _dialogService.showDialog(
          title: 'Erro na autenticação',
          description: 'Senha ou usuário inválidos.',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Erro na autenticação',
        description: result,
      );
    }
  }

  /*void navigateToSignUp() {
    _navigationService.navigateTo(Routes.signUpViewRouter);
  }

  void navigateToPasswordRecovery() {
    _navigationService.navigateTo(Routes.passwordRecoveryViewRouter);
  }*/

  Future<void> login(
      {@required String email, @required String password}) async {
    setBusy(true);
    var success = await _authenticationService.login(email, password);
    if (success) {
      unawaited(_navigationService.navigateTo(Routes.startupViewRouter));
    } else {
      _snackbarService.showSnackbar(
          message: 'Usuário ou senha inválidos', title: 'Login', barBlur: 10.0);
    }
    setBusy(false);
  }*/
}
