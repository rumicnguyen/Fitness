import 'package:fitness_app/src/features/authentication/model/form_error.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class PasswordFormzInput extends FormzInput<String, FormError> {
  const PasswordFormzInput.pure([super.value = '']) : super.pure();
  const PasswordFormzInput.dirty([super.value = '']) : super.dirty();

  @override
  FormError? validator(String? value) {
    if ((value ?? '').isEmpty) {
      return FormError.empty;
    }
    return null;
  }

  String? errorOf(BuildContext context) {
    if (isPure) {
      return null;
    }

    switch (error) {
      case FormError.empty:
        return S.of(context).error_fieldRequired;
      case FormError.invalid:
        return "Password Invalid";
      default:
        return null;
    }
  }
}
