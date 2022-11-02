import 'dart:ui';

import 'package:flutter/material.dart';

class frosted_appbar extends StatelessWidget {
  final url;
  const frosted_appbar({Key? key,required this.url}) : super(key: key);

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
              child: FlexibleSpaceBar(titlePadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text(url),
              ),
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10))),
    );
  }
}
