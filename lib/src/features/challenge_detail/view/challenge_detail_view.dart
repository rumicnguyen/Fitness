import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/challenge_detail/logic/challenge_detail_bloc.dart';
import 'package:fitness_app/src/features/challenge_detail/logic/challenge_detail_state.dart';
import 'package:fitness_app/src/features/challenge_detail/widget/challenge_detail_header.dart';
import 'package:fitness_app/src/features/home/widget/block.dart';
import 'package:fitness_app/src/features/see_workout/widget/view_item.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/widgets/loading.dart';
import 'package:fitness_app/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallengeDetailView extends StatelessWidget {
  const ChallengeDetailView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChallengeDetailBloc>(
      create: (context) => ChallengeDetailBloc(id),
      child: BlocConsumer<ChallengeDetailBloc, ChallengeDetailState>(
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
        buildWhen: (previous, current) => previous.handle != current.handle,
        builder: (context, state) {
          return XScaffold(
            enableAppbar: true,
            iconColor: AppColors.gray,
            child: state.handle.isLoading ? const Loading() : _body(),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return BlocBuilder<ChallengeDetailBloc, ChallengeDetailState>(
      buildWhen: (previous, current) =>
          previous.challenge != current.challenge ||
          previous.handle != current.handle,
      builder: (context, state) {
        return ChallengeDetailHeader(challenge: state.challenge);
      },
    );
  }

  Widget _body() {
    return BlocBuilder<ChallengeDetailBloc, ChallengeDetailState>(
      buildWhen: (previous, current) =>
          previous.workouts != current.workouts ||
          previous.handle != current.handle,
      builder: (context, state) {
        return Column(
          children: [
            _buildHeader(),
            const SizedBox(
              height: 10,
            ),
            XBlock(
              header: S.of(context).workouts,
              enableActions: false,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.workouts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ViewItem(item: state.workouts[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
