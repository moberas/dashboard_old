import 'package:injectable/injectable.dart';
import 'package:moberasweb/commons/firestore/firestore_data_wrapper.dart';
import 'package:moberasweb/pacient/models/pacient.dart';
import 'package:moberasweb/pacient/models/theme_cfg.dart';
import 'package:moberasweb/pacient/services/pacient_service_interface.dart';

@LazySingleton(as: IPacientService)
class IPacientServiceImpl extends IPacientService {
  @override
  Future<void> changeTheme(ThemeCfg theme, String uid) {}

  @override
  Future<List<Pacient>> findByNameOrCpf(String name, String cpf) async {
    var collectionReference = Collection<Pacient>(path: 'users').ref;
    name ??
        collectionReference.where('displayName', isGreaterThanOrEqualTo: name);
    cpf ?? collectionReference.where('cpf', isEqualTo: cpf);
    var snapshots = await collectionReference.getDocuments();
    return snapshots.documents
        .map((doc) => Pacient.fromData(doc.data))
        .toList();
  }

  @override
  Future<List<Pacient>> listAll() {
    return Collection<Pacient>(path: 'users').getData();
  }

  @override
  Future<void> sendMsg(String uid, String msg) {}
}
