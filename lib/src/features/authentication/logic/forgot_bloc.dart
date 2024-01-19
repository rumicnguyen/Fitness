import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/features/authentication/model/email_fromz.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'forgot_state.dart';

class ForgotBloc extends Cubit<ForgotState> {
  ForgotBloc() : super(const ForgotState());

  Future onEnteredConfirmPassword(BuildContext context) async {
    if (state.email.isValid == false || state.status.isInProgress) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        error: S.of(context).error,
      ));
    } else {
      emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        error: '',
      ));
    }
  }

  void onEmailChanged(String value) {
    final email = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: email));
  }
}
