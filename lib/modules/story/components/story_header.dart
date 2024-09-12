import 'package:flutter/material.dart';
import 'package:swipe_bulb_challenge/constants/color_constant.dart';
import 'package:swipe_bulb_challenge/models/story_header_model.dart';
import 'package:swipe_bulb_challenge/widgets/container_background_image_widget.dart';
import 'package:swipe_bulb_challenge/widgets/horizontal_scroll_widget.dart';

class StoryHeader extends StatelessWidget {
  const StoryHeader({super.key, required this.storyHeader});

  final List<StoryHeaderModel> storyHeader;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          _addStoryContainer(context),
          const SizedBox(width: 10),
          Expanded(
            child: HorizontalScrollWidget(
              horizontalHeight: 200,
              delegate: SliverChildBuilderDelegate(
                childCount: storyHeader.length,
                (_, index) {
                  final story = storyHeader[index];
                  return Column(
                    children: [
                      ContainerBackgroundImageWidget(
                        width: 90,
                        height: 130,
                        backgroundImage: story.image,
                        childBackgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        story.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _addStoryContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
            color: ColorConstant.containerColorPrimary,
          ),
          child: Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(
                Icons.add,
                color: ColorConstant.iconColorPrimary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Post Story',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
