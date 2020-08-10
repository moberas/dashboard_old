import 'package:flutter/material.dart';
import 'package:moberasweb/pacient/ui/pacient_profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PacientProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PacientProfileViewModel>.reactive(
      viewModelBuilder: () => PacientProfileViewModel(),
      builder: (context, model, child) => Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Row(children: [
              Expanded(
                flex: 2,
                child: Container(color: Colors.green),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
