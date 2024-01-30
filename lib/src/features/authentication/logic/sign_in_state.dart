part of 'sign_in_bloc.dart';

class SigninState extends Equatable {
  const SigninState({
    required this.email,
    required this.password,
    required this.status,
    required this.loginType,
    required this.message,
  });

  final EmailFormzInput email;
  final PasswordFormzInput password;
  final FormzSubmissionStatus status;
  final MSocialType loginType;
  final String message;

  factory SigninState.ds() => const SigninState(
        email: EmailFormzInput.pure(),
        password: PasswordFormzInput.pure(''),
        status: FormzSubmissionStatus.initial,
        loginType: MSocialType.email,
        message: '',
      );

  bool get isValidated {
    return Formz.validate([email, password]);
  }

  @override
  List<Object> get props => [
        email,
        password,
        status,
        loginType,
      ];

  SigninState copyWith({
    EmailFormzInput? email,
    PasswordFormzInput? password,
    FormzSubmissionStatus? status,
    MSocialType? loginType,
    String? message,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      loginType: loginType ?? this.loginType,
      message: message ?? this.message,
    );
  }
}
