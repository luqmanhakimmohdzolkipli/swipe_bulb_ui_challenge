import 'package:flutter/material.dart';
import 'package:swipe_bulb_challenge/constants/color_constant.dart';
import 'package:swipe_bulb_challenge/models/home_header_model.dart';
import 'package:swipe_bulb_challenge/widgets/button_widget.dart';
import 'package:swipe_bulb_challenge/widgets/container_background_image_widget.dart';
import 'package:swipe_bulb_challenge/widgets/horizontal_scroll_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.homeHeader});

  final List<HomeHeaderModel> homeHeader;

  @override
  Widget build(BuildContext context) {
    return HorizontalScrollWidget(
      horizontalHeight: 180,
      delegate: SliverChildBuilderDelegate(
        childCount: homeHeader.length,
        (context, index) {
          final header = homeHeader[index];
          return ContainerBackgroundImageWidget(
            backgroundImage: header.image,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header.title,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: ColorConstant.textColorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  header.subtitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: ColorConstant.textColorPrimary,
                      ),
                ),
                const SizedBox(height: 10),
                ButtonWidget(
                  onPressed: () {},
                  text: 'Book Now',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
