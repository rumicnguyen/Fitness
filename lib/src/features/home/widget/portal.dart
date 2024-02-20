import 'package:fitness_app/src/features/home/logic/home_bloc.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XPortal extends StatelessWidget {
  const XPortal({
    super.key,
    required this.controller,
    required this.child,
  });

  final OverlayPortalController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: controller,
      overlayChildBuilder: (BuildContext context) {
        return Positioned(
          top: 100,
          right: 90,
          child: XButton(
            width: 100,
            height: 40,
            onPressed: () {
              context.read<HomeBloc>().onLogout();
            },
            child: Text(S.text.home_logout),
          ),
        );
      },
      child: child,
    );
  }
}
