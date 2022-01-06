import 'package:flutter/cupertino.dart';

extension SliverX on Widget {
  Widget asSliver() {
    return SliverToBoxAdapter(child: this);
  }
}
