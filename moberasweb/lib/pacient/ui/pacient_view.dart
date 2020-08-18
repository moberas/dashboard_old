import 'package:flutter/material.dart';
import 'package:moberasweb/locator.dart';
import 'package:moberasweb/login/models/user_profile.dart';
import 'package:moberasweb/pacient/services/pacient_service_interface.dart';
import 'package:moberasweb/pacient/ui/pacient_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PacientView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PacientViewModel>.reactive(
        viewModelBuilder: () => PacientViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Scrollbar(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ...[
                              TextField(
                                controller: model.nameController,
                                keyboardType: TextInputType.name,
                                enableSuggestions: true,
                                decoration: InputDecoration(labelText: 'Nome'),
                              ),
                              TextField(
                                controller: model.cpfController,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: false, decimal: false),
                                enableSuggestions: true,
                                decoration: InputDecoration(labelText: 'CPF'),
                              ),
                              MaterialButton(
                                onPressed: () => model.findPacientByNameOrCpf(),
                                child: Text('Pesquisar'),
                                color: Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    .primary,
                              )
                            ].expand((widget) => [
                                  widget,
                                  SizedBox(
                                    height: 24,
                                    width: 15,
                                  )
                                ]),
                            Visibility(
                              visible: model.pacients != null &&
                                  model.pacients.isNotEmpty,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text('Lista de pacientes:\n'),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _PacientList(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class _PacientList extends ViewModelWidget<PacientViewModel> {
  _PacientList({Key key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, PacientViewModel viewModel) =>
      viewModel.pacients != null && viewModel.pacients.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.pacients?.length,
              itemBuilder: (context, index) => Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(viewModel.pacients[index].uid),
                  ButtonBar(
                    children: [
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          onPressed: () => _messageModalBottomSheet(
                              context, viewModel.pacients[index]),
                          child: Text(' Enviar Mensagem ')),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {
                          viewModel.profile(viewModel.pacients[0]);
                        },
                        child: Text(' Visualizar perfil '),
                      )
                    ],
                  ),
                ],
              )),
            )
          : Container();

  void _messageModalBottomSheet(BuildContext context, UserProfile userProfile) {
    var msgTextController = TextEditingController();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * .60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Theme.of(context).primaryColor,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: msgTextController,
                          keyboardType: TextInputType.name,
                          enableSuggestions: true,
                          decoration: InputDecoration(labelText: 'Mensagem'),
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                    children: [
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Cancelar')),
                      FlatButton(
                        onPressed: () async => await locator<IPacientService>()
                            .sendMsg(userProfile.uid, msgTextController.text),
                        child: Text('Enviar'),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
