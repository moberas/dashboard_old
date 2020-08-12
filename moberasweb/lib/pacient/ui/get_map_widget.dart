// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

Widget getMap(double latitude, double longitude) {

  String htmlId = '7';

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {

    final location = LatLng(latitude, longitude);

    final mapOptions = MapOptions()
      ..zoom = 10
      ..center = location;

    final elem = DivElement()
      ..id = htmlId
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    Marker(MarkerOptions()
      ..position = location
      ..map = map
      ..title = 'Moberas'
    );

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}