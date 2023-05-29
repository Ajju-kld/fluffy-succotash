import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedAppBar extends StatelessWidget {
  final String url;
  const FrostedAppBar({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      pinned: true,
      floating: false,
      backgroundColor: Colors.transparent,
      snap: false,
      flexibleSpace: ClipRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: FlexibleSpaceBar(titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text(url),
              ))),
    );
  }
}
