import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swipe_bulb_challenge/constants/color_constant.dart';
import 'package:swipe_bulb_challenge/constants/size_constant.dart';
import 'package:swipe_bulb_challenge/widgets/container_background_image_widget.dart';

class HomeDestination extends StatelessWidget {
  const HomeDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerBackgroundImageWidget(
          backgroundImage: 'assets/images/holiday/snow_mountain.jpg',
          width: MediaQuery.sizeOf(context).width,
          childPadding: 0,
          childBackgroundColor: Colors.black.withOpacity(0.4),
          child: _title(context, 'Dubai'),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ContainerBackgroundImageWidget(
                backgroundImage: 'assets/images/holiday/klcc.jpg',
                width: MediaQuery.sizeOf(context).width,
                childPadding: 0,
                childBackgroundColor: Colors.black.withOpacity(0.4),
                child: _title(context, 'Malaysia', isDense: true),
              ),
            ),
            Expanded(
              child: ContainerBackgroundImageWidget(
                backgroundImage: 'assets/images/holiday/bali.png',
                width: MediaQuery.sizeOf(context).width,
                childPadding: 0,
                childBackgroundColor: Colors.black.withOpacity(0.4),
                child: _title(context, 'Malaysia', isDense: true),
              ),
            ),
          ],
        )
      ],
    );
  }

  Padding _title(BuildContext context, String title, {bool? isDense = false}) {
    return Padding(
      padding: const EdgeInsets.all(SizeConstant.kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isDense!
              ? Container()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Icon(
                        FontAwesomeIcons.locationDot,
                        color: ColorConstant.iconColorPrimary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: ColorConstant.textColorPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.heart,
              color: ColorConstant.iconColorPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
