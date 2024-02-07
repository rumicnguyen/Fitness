part of 'account_bloc.dart';

class AccountState extends Equatable {
  const AccountState({
    required this.user,
    required this.isChanging,
    required this.friends,
    required this.handle,
  });
  factory AccountState.ds() {
    return AccountState(
      user: UserPrefs.I.getUser() ?? MUser.empty(),
      isChanging: false,
      friends: const [],
      handle: MHandle(),
    );
  }

  final MUser user;
  final bool isChanging;
  final List<MUser> friends;
  final MHandle handle;

  bool get isLogin => user.id.isNotEmpty; // && token.isNotEmpty

  @override
  List<Object> get props {
    return [
      user,
      isChanging,
      friends,
      handle,
    ];
  }

  AccountState login(MUser user) {
    return copyWith(user: user);
  }

  AccountState logOut() {
    return copyWith(user: MUser.empty());
  }

  AccountState copyWith({
    MUser? user,
    bool? isChanging,
    List<MUser>? friends,
    MHandle? handle,
  }) {
    return AccountState(
      user: user ?? this.user,
      isChanging: isChanging ?? this.isChanging,
      friends: friends ?? this.friends,
      handle: handle ?? this.handle,
    );
  }
}
