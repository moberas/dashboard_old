import 'package:flutter/material.dart';
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
                                ])
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
