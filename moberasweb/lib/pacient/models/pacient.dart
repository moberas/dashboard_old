import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moberasweb/commons/logger.dart';

class Pacient
{

  final String name;
  final GeoPoint loginLocation;
  final bool online;
  final int score;
  final String uid;

  Pacient({this.name, this.loginLocation, this.online, this.score, this.uid});

  factory Pacient.fromData(Map<String, dynamic> data) {
    if (data == null) return null;
    try {
      return Pacient(
          name: data['displayName'] ?? '',
          online: data['online'] ?? false,
          score: data['score'] ?? 0);
    } catch (e) {
      Logger.e(e.message);
      return null;
    }
  }
}
