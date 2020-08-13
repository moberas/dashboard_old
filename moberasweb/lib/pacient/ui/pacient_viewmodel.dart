import 'package:flutter/material.dart';
import 'package:moberasweb/locator.dart';
import 'package:moberasweb/login/models/user_profile.dart';
import 'package:moberasweb/pacient/services/pacient_service_interface.dart';
import 'package:moberasweb/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PacientViewModel extends BaseViewModel {
  final _pacientService = locator<IPacientService>();

  final NavigationService _navigationService = locator<NavigationService>();

  var nameController = TextEditingController();

  var cpfController = TextEditingController();

  List<UserProfile> pacients;

  Future<void> findPacientByNameOrCpf() async {
    pacients = await runBusyFuture(_pacientService.findByNameOrCpf(
        nameController.text, cpfController.text));
  }

  void profile(UserProfile profile) {
    _navigationService.navigateTo(Routes.pacientProfileView,
        arguments: PacientProfileViewArguments(profile: profile));
  }

  // ignore: unused_element
  // TODO criar function no banco para push da mensagem
  _messageModalBottomSheet(BuildContext context) {}
}
