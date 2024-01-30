part of 'account_bloc.dart';

class AccountState extends Equatable {
  const AccountState({
    required this.user,
  });
  factory AccountState.ds() {
    return AccountState(
      user: UserPrefs.I.getUser() ?? MUser.empty(),
    );
  }

  final MUser user;

  bool get isLogin => user.id.isNotEmpty; // && token.isNotEmpty

  @override
  List<Object?> get props => [user];

  AccountState login(MUser user) {
    return copyWith(user: user);
  }

  AccountState logOut() {
    return copyWith(user: MUser.empty());
  }

  AccountState copyWith({
    MUser? user,
  }) {
    return AccountState(
      user: user ?? this.user,
    );
  }
}
