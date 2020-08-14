import 'package:moberasweb/commons/logger.dart';

class Activity {
  static const String CollectionPath = 'activities';

  final String uid;
  final String name;
  final int order;
  final String question;
  final String scale;

  Activity({this.name, this.order, this.question, this.scale, this.uid});

  factory Activity.fromData(Map<String, dynamic> data) {
    if (data == null) return null;
    try {
      return Activity(
        name: data['name'] ?? '',
        order: data['order'],
        question: data['question'] ?? '',
        scale: data['scale'] ?? '',
      );
    } catch (e) {
      Logger.e(e.message);
      return null;
    }
  }
}
