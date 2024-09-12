import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swipe_bulb_challenge/constants/color_constant.dart';
import 'package:swipe_bulb_challenge/models/story_content_model.dart';
import 'package:swipe_bulb_challenge/models/story_header_model.dart';
import 'package:swipe_bulb_challenge/modules/story/components/story_header.dart';
import 'package:swipe_bulb_challenge/widgets/button_widget.dart';
import 'package:swipe_bulb_challenge/widgets/container_background_image_widget.dart';

class StoryContent extends StatelessWidget {
  const StoryContent({
    super.key,
    required this.storyContent,
    required this.storyHeader,
  });

  final List<StoryContentModel> storyContent;
  final List<StoryHeaderModel> storyHeader;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: StoryHeader(storyHeader: storyHeader),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: storyContent.length,
              (context, index) {
                final content = storyContent[index];
                return _storyContentItem(context, content);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _storyContentItem(BuildContext context, StoryContentModel content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    'Suggested for you',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorConstant.textColorDisable,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              ButtonWidget(
                onPressed: () {},
                text: 'Follow',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Travel can be done by foot, bicycle, automobile, train, boat, bus, airplane, ship or other means, with or without luggage, and can be one way or round trip. Travel can also include relatively short stays between successive movements, as in the case of tourism.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          ContainerBackgroundImageWidget(
            backgroundImage: content.image,
            childBackgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.heart),
              ),
              const Text('233'),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.comment),
              ),
              const Text('12'),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.bookmark),
              ),
            ],
          )
        ],
      ),
    );
  }
}
