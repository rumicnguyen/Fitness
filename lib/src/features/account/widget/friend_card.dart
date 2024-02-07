import 'package:fitness_app/src/network/model/user/user.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/avatar.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({
    super.key,
    required this.friend,
  });
  final MUser friend;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        XAvatar(
          avatar: friend.avatar ?? '',
          size: 90,
        ),
        Text(
          friend.name ?? '',
          style: AppStyles.blackTextMidium,
        )
      ],
    );
  }
}
