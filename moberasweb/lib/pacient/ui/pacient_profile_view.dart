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
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
              ),
            ),
            /*Expanded(
              flex: 1,
              child: Container(
                color: Colors.black12,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
