import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/features/dashboard/logic/navigation_bar_item.dart';

class DashboardState extends Equatable {
  final XNavigationBarItems item;
  const DashboardState({
    required this.item,
  });

  factory DashboardState.ds() =>
      const DashboardState(item: XNavigationBarItems.home);

  DashboardState copyWith({
    required XNavigationBarItems item,
  }) {
    return DashboardState(
      item: item,
    );
  }

  @override
  List<Object> get props => [item];
}
