import 'package:flutter/material.dart';
import 'package:moberasweb/login/models/user_profile.dart';
import 'package:moberasweb/pacient/ui/get_map_widget.dart';
import 'package:moberasweb/pacient/ui/pacient_profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PacientProfileView extends StatelessWidget {
  final UserProfile profile;
  PacientProfileView({this.profile});
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
                  child: Padding(
                    padding:
                        const EdgeInsets.fromLTRB(500.0, 10.0, 500.0, 10.0),
                    child: Container(
                      child: getMap(-19, -48),
                    ),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
              ),
            ),
            OutlineButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.green[300],
              highlightedBorderColor: Colors.green[300],
              onPressed: () => model.returntoview(),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Expanded(
                    child: Text(
                      "Voltar A Tela De Pesquisa",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
