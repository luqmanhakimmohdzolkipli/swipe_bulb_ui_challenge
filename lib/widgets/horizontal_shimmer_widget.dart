import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swipe_bulb_challenge/widgets/horizontal_scroll_widget.dart';

class HorizontalShimmerWidget extends StatelessWidget {
  const HorizontalShimmerWidget({
    super.key,
    required this.horizontalHeight,
    required this.width,
  });

  final double horizontalHeight;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: HorizontalScrollWidget(
        horizontalHeight: horizontalHeight,
        delegate: SliverChildBuilderDelegate(childCount: 5, (_, index) {
          return SizedBox(
            width: width,
            child: Card(
              margin: const EdgeInsets.only(right: 20, bottom: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 100,
                      height: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
