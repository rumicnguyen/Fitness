import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/challenge/logic/challenge_bloc.dart';
import 'package:fitness_app/src/features/challenge/logic/challenge_state.dart';
import 'package:fitness_app/src/features/challenge/widget/stats.dart';
import 'package:fitness_app/src/features/home/widget/block.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/stats_type.dart';
import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/card_item/card_item.dart';
import 'package:fitness_app/widgets/card_item/card_title.dart';
import 'package:fitness_app/widgets/image_widget.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:fitness_app/widgets/title/title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallengeView extends StatelessWidget {
  const ChallengeView({super.key});

  @override
  Widget build(BuildContext context) {
    return XScaffold(
      child: SingleChildScrollView(
        child: BlocProvider<ChallengeBloc>(
          create: (context) => ChallengeBloc(),
          child: BlocConsumer<ChallengeBloc, ChallengeState>(
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
            buildWhen: (previous, current) =>
                previous.handle != current.handle ||
                previous.isShowJoin != current.isShowJoin ||
                previous.userChallenge != current.userChallenge,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  XTitle(
                    height: 100,
                    title: S.of(context).challenges,
                    actions: state.isShowJoin
                        ? const SizedBox()
                        : Text(
                            '${state.userChallenge.pts} ${S.of(context).points}',
                            style: AppStyles.grayTextSmall,
                          ),
                  ),
                  _buildActiveChallenge(context),
                  const SizedBox(
                    height: 15,
                  ),
                  state.isShowJoin
                      ? _buildButtonJoin(context)
                      : _buildYourStats(context),
                  _buildSpace(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildButtonJoin(BuildContext context) {
    return XButton(
      width: double.infinity,
      height: 40,
      title: S.text.challenge_join,
      icon: const Icon(
        Icons.handshake,
        color: AppColors.second,
      ),
      titleStyle: AppStyles.hyperLink,
      onPressed: () {
        context.read<ChallengeBloc>().onStartChallenge();
      },
    );
  }

  Widget _buildYourStats(BuildContext context) {
    return BlocConsumer<ChallengeBloc, ChallengeState>(
      listenWhen: (previous, current) => previous.handle != current.handle,
      listener: (context, state) {
        state.handle.isLoading ? XToast.showLoading() : XToast.hideLoading();
        if (state.handle.isError) {
          XToast.error(state.handle.message);
        }
        if (!state.handle.isLoading && XToast.isShowLoading) {
          XToast.hideLoading();
        }
      },
      builder: (context, state) {
        return XBlock(
          header: S.of(context).your_stats,
          enableActions: false,
          child: Column(
            children: [
              Stats(
                time: state.userChallenge.startAt ?? DateTime.now(),
                value: state.userChallenge.daysRunning,
                type: StatsType.daysRunning,
              ),
              _buildSpace(),
              Stats(
                time: state.userChallenge.startAt ?? DateTime.now(),
                value: state.userChallenge.kilometresRun,
                type: StatsType.kilometresRun,
              ),
              _buildSpace(),
              Stats(
                time: state.userChallenge.startAt ?? DateTime.now(),
                value: state.userChallenge.tasksCompleted,
                type: StatsType.tasksCompleted,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActiveChallenge(BuildContext context) {
    return BlocConsumer<ChallengeBloc, ChallengeState>(
      listenWhen: (previous, current) => previous.handle != current.handle,
      listener: (context, state) {
        state.handle.isLoading ? XToast.showLoading() : XToast.hideLoading();
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
            XBlock(
              header: S.of(context).active_challenge,
              enableActions: false,
              child: XCardItem(
                magin: const EdgeInsets.symmetric(horizontal: 2.0),
                width: 340,
                height: 230,
                tag: state.challenge.tag,
                backgroundImage: ImageWidget(
                  width: 340,
                  height: 230,
                  image: state.challenge.thumbnail,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  folder: StorageFolder.challenges,
                ),
                onTap: () {
                  AppCoordinator.showChallengeDetailsScreen(
                    id: state.challenge.id,
                  );
                },
                child: XCartTitle(
                  title: state.challenge.name,
                  members: state.challenge.members,
                  level: state.challenge.level,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(height: 1.5),
                children: [
                  TextSpan(
                    text: state.challenge.decription,
                    style: AppStyles.grayTextSmall,
                  ),
                  TextSpan(
                    text: S.of(context).tab + S.of(context).read_more,
                    style: AppStyles.hyperLink,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppCoordinator.showChallengeDetailsScreen(
                            id: state.challenge.id);
                      },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSpace() {
    return const SizedBox(
      height: 10,
    );
  }
}
