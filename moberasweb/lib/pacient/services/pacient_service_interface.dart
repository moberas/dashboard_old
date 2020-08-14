import 'package:moberasweb/login/models/user_profile.dart';
import 'package:moberasweb/pacient/models/theme_cfg.dart';

abstract class IPacientService {
  Future<List<UserProfile>> listAll();
  Future<List<UserProfile>> findByNameOrCpf(String name, String cpf);
  Future<void> sendMsg(String uid, String msg);
  Future<void> changeTheme(ThemeCfg theme, String uid);
}
