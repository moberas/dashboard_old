import 'package:flutter/material.dart';
import 'package:moberasweb/locator.dart';
import 'package:moberasweb/pacient/models/pacient.dart';
import 'package:moberasweb/pacient/services/pacient_service_interface.dart';
import 'package:stacked/stacked.dart';

class PacientViewModel extends BaseViewModel {
  final _pacientService = locator<IPacientService>();

  var nameController = TextEditingController();

  var cpfController = TextEditingController();

  List<Pacient> pacients;

  Future<List<Pacient>> findPacientByNameOrCpf() async {
    pacients = await runBusyFuture(_pacientService.findByNameOrCpf(
        nameController.text, cpfController.text));
    return pacients;
  }
}
