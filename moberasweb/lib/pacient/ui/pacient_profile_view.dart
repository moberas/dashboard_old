import 'package:flutter/material.dart';
import 'package:moberasweb/commons/ui/Constants.dart';
import 'package:moberasweb/pacient/ui/get_map_widget.dart';
import 'package:moberasweb/pacient/ui/pacient_profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PacientProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PacientProfileViewModel>.reactive(
      viewModelBuilder: () => PacientProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: Icon(
                Icons.settings,
                color: Colors.black87,
              ),
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: getMap(),
                    ),
                  ),
                ),
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
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.Child) {
      print('Infantil');
    } else if (choice == Constants.Adult) {
      print('Adulto');
    } else if (choice == Constants.Elder) {
      print('Idoso');
    } else if (choice == Constants.ColorBlind) {
      print('Daltonico');
    }
  }
}
