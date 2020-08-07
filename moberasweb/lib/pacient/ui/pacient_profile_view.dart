import 'package:flutter/material.dart';
import 'package:moberasweb/pacient/ui/pacient_profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PacientProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PacientProfileViewModel>.reactive(
        viewModelBuilder: () => PacientProfileViewModel(),
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
                            ]
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
