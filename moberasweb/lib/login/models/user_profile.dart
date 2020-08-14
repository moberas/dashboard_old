import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moberasweb/commons/logger.dart';

class UserProfile {
  static const String CollectionPath = 'users-moberas';

  final String displayName;
  final String email;
  final String username;

  final GeoPoint loginLocation;
  final bool online;
  final int score;
  final String uid;

  UserProfile({this.displayName, this.email, this.username, this.loginLocation, this.online, this.score, this.uid});

  factory UserProfile.fromData(Map<String, dynamic> data) {
    if (data == null) return null;
    try {
      return UserProfile(
          displayName: data['displayName'] ?? '',
          email: data['email'] ?? '',
          username: data['username'] ?? '',
          loginLocation: data['loginLocation'],
          online: data['online'],
          score: data['score'],
          uid: data['uid']
      );
    } catch (e) {
      Logger.e(e.message);
      return null;
    }
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      'displayName': displayName ?? displayName,
      'email': email ?? email,
      'username': username ?? username,
    };
  }

  @override
  String toString() {
    return 'Name: ' +
        displayName +
        '\n' +
        'Email: ' +
        email +
        '\n' +
        'Username: ' +
        username +
        '\n';
  }
}
