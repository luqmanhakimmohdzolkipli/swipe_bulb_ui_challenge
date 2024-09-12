import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swipe_bulb_challenge/constants/size_constant.dart';
import 'package:swipe_bulb_challenge/models/story_content_model.dart';
import 'package:swipe_bulb_challenge/models/story_header_model.dart';
import 'package:swipe_bulb_challenge/modules/story/components/story_content.dart';
import 'package:swipe_bulb_challenge/widgets/horizontal_shimmer_widget.dart';
import 'package:swipe_bulb_challenge/widgets/vertical_shimmer_widget.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  List<StoryHeaderModel> _storyHeader = [];
  List<StoryContentModel> _storyContent = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      _getStoryHeader();
      _getStoryContent();
    });
  }

  Future<void> _getStoryHeader() async {
    final String response =
        await rootBundle.loadString('assets/samples/story_header.json');
    setState(() {
      _storyHeader = listStoryHeaderModelFromJson(response);
    });
  }

  Future<void> _getStoryContent() async {
    final String response =
        await rootBundle.loadString('assets/samples/story_content.json');
    setState(() {
      _storyContent = listStoryContentModelFromJson(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Holiday',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.bell),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.paperPlane),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(SizeConstant.kDefaultPadding),
        child: Column(
          children: [
            _storyHeader.isNotEmpty || _storyContent.isNotEmpty
                ? StoryContent(
                    storyHeader: _storyHeader,
                    storyContent: _storyContent,
                  )
                : const Expanded(
                    child: Column(
                      children: [
                        HorizontalShimmerWidget(
                          horizontalHeight: 130,
                          width: 100,
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: VerticalShimmerWidget(),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
