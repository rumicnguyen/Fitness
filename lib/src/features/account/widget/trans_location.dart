import 'package:fitness_app/gen/assets.gen.dart';
import 'package:fitness_app/src/features/intro/logic/intro_bloc.dart';
import 'package:fitness_app/src/features/intro/logic/intro_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransLocation extends StatelessWidget {
  const TransLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroBloc, IntroState>(
      buildWhen: (previous, current) {
        return previous.locale != current.locale;
      },
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            state.locale == const Locale('en')
                ? context
                    .read<IntroBloc>()
                    .onChangeLocalizations(const Locale('vi'))
                : context
                    .read<IntroBloc>()
                    .onChangeLocalizations(const Locale('en'));
          },
          icon: SizedBox(
            width: 50,
            height: 50,
            child: state.locale == const Locale('en')
                // state.locale == const Locale('en')
                ? Image.asset(Assets.images.eng.path)
                : Image.asset(Assets.images.vie.path),
          ),
        );
      },
    );
  }
}
