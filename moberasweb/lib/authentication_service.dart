import 'use_profile.dart';

abstract class AuthenticationService {
  Future<void> signOut();
  Future<bool> get isUserLoggedIn;
  Future<UserProfile> get currentUser;
  Future<bool> login(String crm, password);
  Future<bool> registerFebrasgoAssociatedWithFirebase(
      String email, String password);
  Future<void> changePassword(
      int idUserFebrasgo, String name, String email, String newPassword);
}
