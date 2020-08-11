import 'package:flutter/material.dart';
import 'package:moberasweb/locator.dart';
import 'package:moberasweb/pacient/models/pacient.dart';
import 'package:moberasweb/pacient/services/pacient_service_interface.dart';
import 'package:moberasweb/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PacientProfileViewModel extends BaseViewModel {
  final _pacientService = locator<IPacientService>();

  final NavigationService _navigationService = locator<NavigationService>();

  var nameController = TextEditingController();

  var cpfController = TextEditingController();

  List<Pacient> pacients;

  Future<List<Pacient>> findPacientByNameOrCpf() async {
    pacients = await runBusyFuture(_pacientService.findByNameOrCpf(
        nameController.text, cpfController.text));
    return pacients;
  }

  void returntoview() {
    _navigationService.navigateTo(Routes.pacientView);
  }
}
