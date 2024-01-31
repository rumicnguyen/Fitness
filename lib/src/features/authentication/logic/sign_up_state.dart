part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const EmailFormzInput.pure(),
    this.password = const PasswordFormzInput.pure(''),
    this.confirmPassword = const PasswordFormzInput.pure(''),
    this.status = FormzSubmissionStatus.initial,
    this.message = '',
  });

  final EmailFormzInput email;
  final PasswordFormzInput password;
  final PasswordFormzInput confirmPassword;
  final FormzSubmissionStatus status;
  final String message;

  bool get isValidated {
    return Formz.validate([email, password, confirmPassword]);
  }

  @override
  List<Object> get props => [email, password, status, confirmPassword];

  SignUpState copyWith({
    EmailFormzInput? email,
    PasswordFormzInput? password,
    PasswordFormzInput? confirmPassword,
    FormzSubmissionStatus? status,
    String? message,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
