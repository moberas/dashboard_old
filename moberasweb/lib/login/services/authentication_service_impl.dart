import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:moberasweb/commons/logger.dart';
import 'package:moberasweb/login/models/user_profile.dart';
import 'package:moberasweb/login/services/authentication_service.dart';

@Singleton(as: AuthenticationService)
class AuthenticationServiceImpl implements AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<bool> get isUserLoggedIn async {
    var currentUser = await _firebaseAuth.currentUser();
    return currentUser != null && currentUser.isAnonymous == false;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  // TODO: implement currentUser
  Future<UserProfile> get currentUser => throw UnimplementedError();

  @override
  Future<bool> login(String email, password) async {
    try {
      AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (e) {
      Logger.e(e?.message);
      return false;
    }
  }

  @override
  Future<void> changePassword(String email) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}
