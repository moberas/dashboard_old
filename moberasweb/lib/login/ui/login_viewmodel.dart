import 'package:flutter/material.dart';
import 'package:moberasweb/commons/validators.dart';
import 'package:moberasweb/locator.dart';
import 'package:moberasweb/login/services/authentication_service.dart';
import 'package:moberasweb/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel with Validators {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  //final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final SnackbarService _snackbarService = locator<SnackbarService>();

  Future checkSignInResult(result) async {
    if (result is bool) {
      if (result) {
        /*await _analyticsService.logLogin('email');
        unawaited(_navigationService
            .pushNamedAndRemoveUntil(Routes.startupViewRouter)); */
      } else {
        /*await _dialogService.showDialog(
          title: 'Erro na autenticação',
          description: 'Senha ou usuário inválidos.',
        );*/
      }
    } else {
      /*await _dialogService.showDialog(
        title: 'Erro na autenticação',
        description: result,
      );*/
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
      _navigationService.navigateTo(Routes.pacientView);
    } else {
      _snackbarService.showSnackbar(
          message: 'Usuário ou senha inválidos', title: 'Login');
    }
    setBusy(false);
  }
}
