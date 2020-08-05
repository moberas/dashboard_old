import 'package:moberasweb/pacient/models/pacient.dart';
import 'package:moberasweb/pacient/models/theme_cfg.dart';

abstract class IPacientService {
  Future<List<Pacient>> listAll();
  Future<List<Pacient>> findByNameOrCpf(String name, String cpf);
  Future<void> sendMsg(String uid, String msg);
  Future<void> changeTheme(ThemeCfg theme, String uid);
}
