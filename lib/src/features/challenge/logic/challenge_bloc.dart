import 'package:fitness_app/src/features/challenge/logic/challenge_state.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/challenge/challenge.dart';
import 'package:fitness_app/src/network/model/common/handle.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/network/model/user_challenge/user_challenge.dart';
import 'package:fitness_app/src/services/user_prefs.dart';
import 'package:fitness_app/src/utils/string_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallengeBloc extends Cubit<ChallengeState> {
  ChallengeBloc() : super(ChallengeState.ds()) {
    syncData();
  }

  DomainManager get domain => DomainManager();

  Future syncData() async {
    emit(state.copyWith(handle: MHandle.loading()));
    final activeChallenge = await domain.challenge.getActiveChallenges();
    if (activeChallenge.isSuccess && activeChallenge.data != null) {
      if (activeChallenge.data!.isNotEmpty) {
        emit(state.copyWith(challenge: activeChallenge.data![0]));
      } else {
        emit(state.copyWith(challenge: MChallenge.empty()));
      }
    }
    final user = UserPrefs.I.getUser() ?? MUser.empty();
    final userChallenge = await domain.user.getUserChallenge(
      userId: user.id,
      challengeId: state.challenge.id,
    );
    if (userChallenge.isSuccess &&
        userChallenge.data != null &&
        userChallenge.data!.id.isNotEmpty) {
      emit(state.copyWith(
        userChallenge: userChallenge.data!,
        isShowJoin: false,
      ));
    }
    emit(state.copyWith(handle: MHandle.result(activeChallenge)));
  }

  Future onStartChallenge() async {
    emit(state.copyWith(handle: MHandle.loading()));
    final user = UserPrefs.I.getUser();
    final MUserChallenge userChallenge = MUserChallenge(
      id: StringUtils.generateId(),
      startAt: DateTime.now(),
      challengeId: state.challenge.id,
      userId: user?.id ?? '',
    );
    final result =
        await domain.userChallenge.getUpdateOrAddUserChallenge(userChallenge);

    if (result.isSuccess && result.data != null) {
      emit(state.copyWith(
        handle: MHandle.result(result),
        isShowJoin: false,
      ));
    } else {
      emit(state.copyWith(handle: MHandle.error(S.text.error)));
    }
  }
}
