import 'package:card_swiper/card_swiper.dart';
import 'package:fitness_app/src/features/account/logic/account_bloc.dart';
import 'package:fitness_app/src/features/account/widget/friend_card.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/network/data/enum/profile_type.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:fitness_app/widgets/avatar.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:fitness_app/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider<AccountBloc>(
      create: (BuildContext context) {
        return AccountBloc();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            XSection(
              top: 30,
              left: 30,
              right: 30,
              bottom: 15,
              child: _buildHeader(context),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: AppColors.gray,
            ),
            XSection(
              vertical: 10,
              horizontal: 30,
              child: SizedBox(
                height: screenSize.height - 338,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildOverview(),
                      _buildFriend(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAvatar(),
        const SizedBox(
          height: 20,
        ),
        _buildButtonChange(context),
      ],
    );
  }

  Widget _buildFriend() {
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) => previous.friends != current.friends,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).profile_friends,
              style: AppStyles.heading,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Swiper(
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.5,
                scale: 0.9,
                itemCount: state.friends.length,
                itemBuilder: (_, index) {
                  return FriendCard(friend: state.friends[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOverview() {
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).profile_overview,
              style: AppStyles.heading,
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                _buildInfoItem(
                  type: ProfileType.gender,
                  value: state.user.gender ?? '',
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildInfoItem(
                  type: ProfileType.height,
                  value: state.user.height.toString(),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildInfoItem(
                  type: ProfileType.weight,
                  value: state.user.weight.toString(),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildInfoItem(
                  type: ProfileType.age,
                  value: state.user.age.toString(),
                ),
                const SizedBox(
                  height: 10,
                ),
                state.user.target.isEmpty
                    ? _buildInfoItem(
                        type: ProfileType.target,
                        value: S.of(context).none,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).profile_target,
                            style: AppStyles.blackTextSmallB,
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 5),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.user.target.length,
                            itemBuilder: (context, index) {
                              return XSection(
                                bottom: 5,
                                child: Row(
                                  children: [
                                    _buildText('${index + 1}. '),
                                    _buildText(state.user.target[index]),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget _buildInfoItem({required ProfileType type, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type.value,
          style: AppStyles.blackTextMidiumB,
        ),
        _buildText(value + type.unit),
      ],
    );
  }

  Widget _buildText(String value) {
    return Text(
      value,
      style: AppStyles.blackTextMidium,
    );
  }

  Widget _buildButtonChange(BuildContext context) {
    return XButton(
      width: double.infinity,
      height: 40,
      title: S.of(context).profile_edit,
      icon: const Icon(
        Icons.edit,
        color: AppColors.second,
      ),
      titleStyle: AppStyles.hyperLink,
      onPressed: () {
        context.read<AccountBloc>().onEdit(true);
      },
    );
  }

  Widget _buildAvatar() {
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) {
        return previous.user != current.user;
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            XAvatar(
              avatar: state.user.avatar,
              size: 80,
              showEdit: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              state.user.name ?? '',
              style: AppStyles.heading,
            ),
            _buildText(state.user.email ?? ''),
          ],
        );
      },
    );
  }
}
