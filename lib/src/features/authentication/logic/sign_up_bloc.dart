import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/features/authentication/model/email_fromz.dart';
import 'package:fitness_app/src/features/authentication/model/model_input.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Cubit<SignUpState> {
  SignUpBloc() : super(const SignUpState());

  DomainManager get domain => DomainManager();

  Future signupWithEmail(BuildContext context) async {
    if (state.status.isInProgress) return;
    if (state.isValidated == false) {
      if (context.mounted) {
        failed(context: context);
      }
      return;
    }

    if (state.confirmPassword != state.password) {
      if (context.mounted) {
        failed(context: context, error: S.of(context).password_not_match);
      }
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final email = state.email.value;
    final password = state.password.value;
    final result =
        await domain.sign.signUpWithEmail(email: email, password: password);
    if (result.isSuccess) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      if (context.mounted) {
        signupDecision(context, result.data!);
      }
    } else {
      if (context.mounted) {
        failed(context: context);
      }
    }
  }

  Future signupDecision(BuildContext context, MUser incomingUser) async {
    final result = await domain.sign.connectBESignUpWithEmail(incomingUser);
    if (result.isSuccess) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).success),
          ),
        );
      }
      AppCoordinator.pop();
    } else {
      if (context.mounted) {
        failed(context: context);
      }
    }
  }

  void failed({required BuildContext context, String? error}) {
    emit(state.copyWith(status: FormzSubmissionStatus.failure));
    if (context.mounted) {
      final String text = error ?? '';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).failed + text),
        ),
      );
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

  void onConfirmPasswordChanged(String value) {
    final formz = PasswordFormzInput.dirty(value);
    emit(state.copyWith(confirmPassword: formz));
  }
}
