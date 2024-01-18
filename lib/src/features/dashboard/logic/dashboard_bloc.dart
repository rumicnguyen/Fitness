import 'package:fitness_app/src/features/dashboard/logic/dasboard_state.dart';
import 'package:fitness_app/src/features/dashboard/logic/navigation_bar_item.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Cubit<DashboardState> {
  DashboardBloc() : super(DashboardState.ds());

  void onDestinationSelected(int index) {
    emit(state.copyWith(item: XNavigationBarItems.values[index]));
    AppCoordinator.goNamed(XNavigationBarItems.values[index].route.name);
  }

  void goHome() {
   emit(state.copyWith(item: XNavigationBarItems.home));
    AppCoordinator.goNamed(XNavigationBarItems.home.route.name);
  }
}
