import 'package:fitness_app/src/features/home/widget/block.dart';
import 'package:fitness_app/src/features/most_popular/logic/most_popular_bloc.dart';
import 'package:fitness_app/src/features/most_popular/logic/most_popular_state.dart';
import 'package:fitness_app/src/features/most_popular/widget/most_popupar_item.dart';
import 'package:fitness_app/src/localization/localization_utils.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider<MostPopularBloc>(
      create: (context) => MostPopularBloc(),
      child: BlocBuilder<MostPopularBloc, MostPopularState>(
        buildWhen: (previous, current) {
          return previous.mostPopular != current.mostPopular ||
              previous.handle != current.handle;
        },
        builder: (context, state) {
          return XBlock(
            height: screenSize.height - 400,
            header: S.of(context).most_popular,
            onPressed: () {
              AppCoordinator.showWorkoutListScreen();
            },
            child: state.handle.isLoading
                ? const Loading()
                : GridView.count(
                    primary: false,
                    padding: EdgeInsets.zero,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: state.mostPopular
                        .map((e) => MostPopularItem(item: e))
                        .toList(),
                  ),
          );
        },
      ),
    );
  }
}
