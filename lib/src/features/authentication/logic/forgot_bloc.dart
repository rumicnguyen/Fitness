import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/features/authentication/model/email_fromz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'forgot_state.dart';

class ForgotBloc extends Cubit<ForgotState> {
  ForgotBloc() : super(const ForgotState());

  Future onEnteredConfirmPassword(BuildContext context) async {
    if (state.email.isPure) {
      emit(state.copyWith(
        email: const EmailFormzInput.dirty(''),
      ));
    }
    emit(state.copyWith(
      error: state.email.errorOf(context),
    ));
  }

  void onEmailChanged(String value) {
    final email = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: email));
  }
}
