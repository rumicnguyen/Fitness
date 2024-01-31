import 'package:equatable/equatable.dart';
import 'package:fitness_app/src/features/authentication/model/email_fromz.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/domain_manager.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'forgot_state.dart';

class ForgotBloc extends Cubit<ForgotState> {
  ForgotBloc() : super(const ForgotState());

  DomainManager get domain => DomainManager();

  Future forgotPassword(BuildContext context) async {
    if (state.email.isValid == false || state.status.isInProgress) {
      return;
    }
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    ));

    final MResult<String> result =
        await domain.sign.forgotPassword(state.email.value);
    if (result.isSuccess) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).check_email),
          ),
        );
      }
      AppCoordinator.pop();
    } else {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: result.error,
        ),
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).failed),
          ),
        );
      }
    }
  }

  void onEmailChanged(String value) {
    print(state.email.value);
    final email = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: email));
  }
}
