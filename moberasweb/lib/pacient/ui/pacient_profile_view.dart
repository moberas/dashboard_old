import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moberasweb/commons/ui/Constants.dart';
import 'package:moberasweb/login/models/user_profile.dart';
import 'package:moberasweb/pacient/models/pacient.dart';
import 'package:moberasweb/pacient/ui/get_map_widget.dart';
import 'package:moberasweb/pacient/ui/pacient_profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PacientProfileView extends StatelessWidget {
  final UserProfile profile;
  PacientProfileView({this.profile});

  Widget createTextWidget(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30),
    );
  }

  Widget createDivider(BuildContext context) {
    return SizedBox(
        height: 20.0,
        width: MediaQuery.of(context).size.width * 0.95,
        child: Divider(
          color: Colors.grey.shade500,
        ));
  }

  Widget createPacientInfoBox(BuildContext context, UserProfile pacient) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            createTextWidget('Nome: ' + pacient.displayName),
            createDivider(context),
            createTextWidget('Localização: ' +
                pacient.loginLocation.latitude.toString() +
                ', ' +
                pacient.loginLocation.longitude.toString()),
            createDivider(context),
            createTextWidget(
                'Status: ' + _getPacientStatusString(pacient.online)),
            createDivider(context),
            createTextWidget('Pontuação: ' + pacient.score.toString()),
            createDivider(context),
            createTextWidget('ID: ' + pacient.uid),
          ],
        ),
      ),
    );
  }

  String _getPacientStatusString(bool online) {
    return online ? 'Online' : 'Offline';
  }

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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: createPacientInfoBox(context, profile)),
                        Expanded(
                            child: Container(
                                child: getMap(profile.loginLocation.latitude,
                                    profile.loginLocation.longitude))),
                      ],
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
    }
    if (choice == Constants.ColorBlind) {
      print('Daltônico');
    }
  }
}
