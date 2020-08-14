import 'package:moberasweb/activities/services/activities_services.dart';
import 'package:moberasweb/commons/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'package:moberasweb/locator.dart';
// import 'package:moberasweb/router/router.gr.dart';
// import 'package:stacked_services/stacked_services.dart';

class ActivitiesViewModel extends BaseViewModel {
  // final NavigationService _navigationService = locator<NavigationService>();
  final ActivitiesServices _service = ActivitiesServices();

  dynamic onFormSubmit(Map map) async {
    try {
      await _service.submitActivity(map);
      DialogService().showDialog(
        title: 'Sucesso',
        description: 'Atividade adicionada com sucesso',
      );
    } catch (e) {
      Logger.e(e);
    }
  }

  // void profile() {
  //   _navigationService.navigateTo(Routes.pacientProfileView);
  // }
}
