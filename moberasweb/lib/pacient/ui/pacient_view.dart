import 'package:flutter/material.dart';
import 'package:moberasweb/pacient/ui/pacient_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PacientView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PacientViewModel>.reactive(
        viewModelBuilder: () => PacientViewModel(),
        //onModelReady: (model) => ,
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
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('Lista de pacientes:\n'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Visibility(
                                          visible: true,
                                          child: _PacientList(),
                                        ),
                                      ),
                                    ),
                                    ButtonBar(
                                      children: [
                                        FlatButton(
                                            onPressed: () => null,
                                            child: Text('Enviar Mensagem')),
                                        FlatButton(
                                          onPressed: () => model.profile(),
                                          child: Text('Perfil do Paciente'),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
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

// ignore: unused_element
class _PacientList extends ViewModelWidget<PacientViewModel> {
  _PacientList({Key key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, PacientViewModel viewModel) =>
      viewModel.pacients != null
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.pacients?.length,
              itemBuilder: (context, index) =>
                  Container(child: Text(viewModel.pacients[index].name)))
          : CircularProgressIndicator();
}
