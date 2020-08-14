import 'package:injectable/injectable.dart';
import 'package:moberasweb/commons/firestore/firestore_data_wrapper.dart';
import 'package:moberasweb/login/models/user_profile.dart';
import 'package:moberasweb/pacient/models/theme_cfg.dart';
import 'package:moberasweb/pacient/services/pacient_service_interface.dart';

@LazySingleton(as: IPacientService)
class IPacientServiceImpl extends IPacientService {
  @override
  Future<void> changeTheme(ThemeCfg theme, String uid) {
    return null;
  }

  @override
  Future<List<UserProfile>> findByNameOrCpf(String name, String cpf) async {
    var collectionReference = Collection<UserProfile>(path: 'users').ref;
    name ??
        collectionReference.where('displayName', isGreaterThanOrEqualTo: name);
    cpf ?? collectionReference.where('cpf', isEqualTo: cpf);
    var snapshots = await collectionReference.getDocuments();
    return snapshots.documents
        .map((doc) => UserProfile.fromData(doc.data))
        .toList();
  }

  @override
  Future<List<UserProfile>> listAll() {
    return Collection<UserProfile>(path: 'users').getData();
  }

  @override
  Future<void> sendMsg(String uid, String msg) {
    return null;
  }
}
