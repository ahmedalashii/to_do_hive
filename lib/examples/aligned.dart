import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'common.dart';

class AlignedPage extends StatelessWidget {
  const AlignedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Aligned',
      child: AlignedGridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return Tile(
            index: index,
            extent: (index % 7 + 1) * 30,
          );
        },
      ),
    );
  }
}
