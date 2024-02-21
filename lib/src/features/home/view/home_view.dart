import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/home/logic/home_bloc.dart';
import 'package:fitness_app/src/features/home/logic/home_state.dart';
import 'package:fitness_app/src/features/home/view/dashboard_view.dart';
import 'package:fitness_app/src/features/home/view/friends_activity_view.dart';
import 'package:fitness_app/src/features/home/widget/block.dart';
import 'package:fitness_app/src/features/workout/widget/workout_card.dart';
import 'package:fitness_app/src/features/home/view/today_activity_view.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/widgets/card_item/card_item.dart';
import 'package:fitness_app/widgets/card_item/card_title.dart';
import 'package:fitness_app/widgets/image_widget.dart';
import 'package:fitness_app/widgets/loading.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return XScaffold(
      child: SingleChildScrollView(
        child: BlocProvider<HomeBloc>(
          create: (context) {
            return HomeBloc();
          },
          child: BlocConsumer<HomeBloc, HomeState>(
            listenWhen: (previous, current) =>
                previous.handle != current.handle,
            listener: (context, state) {
              state.handle.isLoading
                  ? XToast.showLoading()
                  : XToast.hideLoading();
              if (state.handle.isError) {
                XToast.error(state.handle.message);
              }
              if (!state.handle.isLoading && XToast.isShowLoading) {
                XToast.hideLoading();
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  const DashboardView(),
                  _buildPlace(),
                  _buildTodayActivity(),
                  _buildPlace(),
                  _buildNextWorkout(),
                  _buildPlace(),
                  _buildActiveChallenge(),
                  _buildPlace(),
                  _buildPodcasts(),
                  _buildPlace(),
                  const FriendsActivityView(),
                  _buildPlace(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPlace() {
    return const SizedBox(
      height: 25.0,
    );
  }

  Widget _buildTodayActivity() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.handle != current.handle ||
            previous.todayActivity != current.todayActivity;
      },
      builder: (context, state) {
        return TodayActivityView(
          hours: state.todayActivity.hours,
          kcal: state.todayActivity.kcal,
          km: state.todayActivity.km,
        );
      },
    );
  }

  Widget _buildNextWorkout() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.handle != current.handle ||
            previous.nextWorkouts != current.nextWorkouts;
      },
      builder: (context, state) {
        return WorkoutCard(
          label: S.of(context).next_workout,
          item: state.nextWorkouts,
          onPressed: () {
            AppCoordinator.showWorkoutListScreen();
          },
        );
      },
    );
  }

  Widget _buildActiveChallenge() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.handle != current.handle ||
            previous.activeChallenge != current.activeChallenge;
      },
      builder: (context, state) {
        return state.handle.isLoading
            ? const Loading()
            : XBlock(
                header: S.of(context).active_challenge,
                enableActions: false,
                child: XCardItem(
                  magin: const EdgeInsets.symmetric(horizontal: 2.0),
                  width: 340,
                  height: 230,
                  tag: state.activeChallenge.tag,
                  backgroundImage: ImageWidget(
                    width: 340,
                    height: 230,
                    image: state.activeChallenge.thumbnail,
                    folder: StorageFolder.challenges,
                  ),
                  onTap: () {
                    AppCoordinator.showChallengeDetailsScreen(
                      id: state.activeChallenge.id,
                    );
                  },
                  child: XCartTitle(
                    title: state.activeChallenge.name,
                    members: state.activeChallenge.members,
                    level: state.activeChallenge.level,
                  ),
                ),
              );
      },
    );
  }

  Widget _buildPodcasts() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.handle != current.handle ||
            previous.podcasts != current.podcasts;
      },
      builder: (context, state) {
        return WorkoutCard(
          label: S.of(context).podcasts,
          item: state.podcasts,
          onPressed: () {
            AppCoordinator.showWorkoutListScreen();
          },
        );
      },
    );
  }
}
