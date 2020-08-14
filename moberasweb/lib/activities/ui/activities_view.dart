import 'package:flutter/material.dart';
import 'package:moberasweb/activities/ui/activities_viewmodel.dart';
import 'package:moberasweb/commons/validators.dart';
import 'package:quick_form/quick_form.dart';
import 'package:stacked/stacked.dart';

class ActivitiesView extends StatelessWidget {
  final formFields = <Field>[
    Field(
      name: 'name',
      label: 'Nome',
      mandatory: true,
    ),
    Field(
      name: 'order',
      label: 'Ordem',
      mandatory: true,
      validators: const [Validators.validateOrder],
    ),
    Field(
      name: 'question',
      label: 'Questão',
      mandatory: true,
    ),
    Field(
      name: 'scale',
      label: 'Escala',
      mandatory: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActivitiesViewModel>.reactive(
      viewModelBuilder: () => ActivitiesViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: formFields.buildSimpleForm(
            onFormSubmitted: model.onFormSubmit,
          ),
        ),
      ),
    );
  }
}
