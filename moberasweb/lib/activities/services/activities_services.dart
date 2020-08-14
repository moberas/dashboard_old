import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moberasweb/activities/models/activity.dart';

class ActivitiesServices {
  Future<void> submitActivity(Map map) {
    final Firestore _db = Firestore.instance;
    final doc = _db.collection(Activity.CollectionPath).document();

    return doc.setData(map);
  }
}
