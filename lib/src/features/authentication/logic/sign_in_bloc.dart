import 'package:equatable/equatable.dart';
import 'package:fitness_app/dialogs/toast_wrapper.dart';
import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/features/authentication/model/email_fromz.dart';
import 'package:fitness_app/src/features/authentication/model/model_input.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/social_type.dart';
import 'package:fitness_app/src/network/model/social_user/social_user.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:formz/formz.dart';

part 'sign_in_state.dart';

class SigninBloc extends Cubit<SigninState> {
  SigninBloc() : super(SigninState.ds());

  DomainManager get domain => DomainManager();

  Future loginWithEmail(BuildContext context) async {
    if (state.status.isInProgress) return;
    if (state.isValidated == false) {
      return;
    }
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.email,
    ));
    final email = state.email.value;
    final password = state.password.value;
    final result =
        await domain.sign.loginWithEmail(email: email, password: password);

    if (result.isSuccess && context.mounted) {
      return connectBEWithEmail(context, result.data!);
    }

    if (context.mounted) {
      return loginDecision(context, result);
    }
  }

  Future loginWithGoogle(BuildContext context) async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.google,
    ));
    final result = await domain.sign.loginWithGoogle();

    if (context.mounted) {
      return loginSocialDecision(context, result, MSocialType.google);
    }
  }

  Future loginSocialDecision(BuildContext context, MResult<MSocialUser> result,
      MSocialType socialType) async {
    if (result.isSuccess) {
      final data = result.data!;
      if (socialType == MSocialType.google) {
        connectBEWithGoogle(context, data);
      }
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future connectBEWithEmail(BuildContext context, MUser user) async {
    final result = await domain.sign.connectBEWithEmail(user);

    if (context.mounted) {
      return loginDecision(context, result);
    }
  }

  Future connectBEWithGoogle(BuildContext context, MSocialUser user) async {
    final result = await domain.sign.connectBEWithGoogle(user);

    if (context.mounted) {
      return loginDecision(context, result, socialType: user.type);
    }
  }

  Future loginDecision(BuildContext context, MResult<MUser> result,
      {MSocialType? socialType}) async {
    if (result.isSuccess) {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
      GetIt.I<AccountBloc>().onLoginSuccess(result.data!);
      AppCoordinator.showHomeScreen();
      XToast.success(S.text.toast_sign_in_success);
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      XToast.error(S.text.toast_sign_in_failt);
    }
  }

  void onEmailChanged(String value) {
    final formz = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: formz));
  }

  void onPasswordChanged(String value) {
    final formz = PasswordFormzInput.dirty(value);
    emit(state.copyWith(password: formz));
  }
}
