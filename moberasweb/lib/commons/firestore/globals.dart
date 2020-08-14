import 'package:moberasweb/activities/models/activity.dart';
import 'package:moberasweb/login/models/user_profile.dart';
import 'package:moberasweb/pacient/models/pacient.dart';
import 'package:moberasweb/pacient/models/theme_cfg.dart';

class Global {
  static final Map models = {
    UserProfile: (data, documentID) => UserProfile.fromData(data),
    ThemeCfg: (data, documentID) => ThemeCfg.fromJson(data),
    Pacient: (data, documentID) => Pacient.fromData(data),
    Activity: (data, documentID) => Activity.fromData(data),
  };
}
