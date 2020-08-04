import 'package:moberasweb/commons/logger.dart';

class UserProfile {
  static const String CollectionPath = 'users-moberas';

  final String name;
  final String email;
  final String username;

  UserProfile({this.name, this.email, this.username});

  factory UserProfile.fromData(Map<String, dynamic> data) {
    if (data == null) return null;
    try {
      return UserProfile(
          name: data['name'] ?? '',
          email: data['email'] ?? '',
          username: data['username'] ?? '');
    } catch (e) {
      Logger.e(e.message);
      return null;
    }
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      'name': name ?? name,
      'email': email ?? email,
      'username': username ?? username,
    };
  }

  @override
  String toString() {
    return 'Name: ' +
        name +
        '\n' +
        'Email: ' +
        email +
        '\n' +
        'Username: ' +
        username +
        '\n';
  }
}
