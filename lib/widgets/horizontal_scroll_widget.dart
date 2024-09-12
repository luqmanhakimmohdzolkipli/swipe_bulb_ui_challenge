import 'package:flutter/material.dart';

class HorizontalScrollWidget extends StatelessWidget {
  const HorizontalScrollWidget({
    super.key,
    required this.horizontalHeight,
    required this.delegate,
  });

  final double horizontalHeight;
  final SliverChildDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: horizontalHeight,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: delegate,
          ),
        ],
      ),
    );
  }
}
