import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swipe_bulb_challenge/constants/color_constant.dart';
import 'package:swipe_bulb_challenge/models/search_content_model.dart';
import 'package:swipe_bulb_challenge/widgets/container_background_image_widget.dart';

class SearchImage extends StatelessWidget {
  const SearchImage({super.key, required this.search});

  final SearchContentModel search;

  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundImageWidget(
      margin: EdgeInsets.zero,
      childBackgroundColor: Colors.transparent,
      childPadding: 0,
      backgroundImage: search.image,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              8,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.containerColorPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.fire,
                        size: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Trending',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorConstant.containerColorPrimary,
                  ),
                  child: Icon(
                    FontAwesomeIcons.heart,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Pro Agency 10% OFF',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorConstant.textColorPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
