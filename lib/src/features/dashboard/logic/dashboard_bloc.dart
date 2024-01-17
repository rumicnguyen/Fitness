

import 'package:fitness_app/src/features/dashboard/logic/navigation_bar_item.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Cubit<XNavigationBarItems> {
  /*
  /// Change to config router. It need to be corrected
  DashboardBloc(super.current) {
    checkForceUpdate();
  }

  Future checkForceUpdate() async {
    final needForceUpdate = await RemoteConfigService.config.needForceUpdate();
    if (needForceUpdate) {
      XAlert.showForceUpdate();
      return true;
    }
    return false;
  }
*/
  DashboardBloc(super.current);

  void onDestinationSelected(int index) {
    emit(XNavigationBarItems.values[index]);
    AppCoordinator.goNamed(state.route.name);
  }

  void goHome() {
    emit(XNavigationBarItems.home);
    AppCoordinator.goNamed(state.route.name);
  }
}

class RemoteConfigService {
}
