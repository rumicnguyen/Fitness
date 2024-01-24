import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class XGrid extends StatelessWidget {
  const XGrid({
    super.key,
    required this.firstItem,
    required this.secondItem,
    required this.thirthItem,
  });

  final Widget firstItem;
  final Widget secondItem;
  final Widget thirthItem;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: firstItem,
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: secondItem,
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: thirthItem,
        ),
      ],
    );
  }
}
