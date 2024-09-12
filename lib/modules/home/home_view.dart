import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swipe_bulb_challenge/constants/size_constant.dart';
import 'package:swipe_bulb_challenge/models/home_category_model.dart';
import 'package:swipe_bulb_challenge/models/home_header_model.dart';
import 'package:swipe_bulb_challenge/modules/home/components/home_category.dart';
import 'package:swipe_bulb_challenge/modules/home/components/home_destination.dart';
import 'package:swipe_bulb_challenge/modules/home/components/home_header.dart';
import 'package:swipe_bulb_challenge/modules/search/search_view.dart';
import 'package:swipe_bulb_challenge/widgets/button_widget.dart';
import 'package:swipe_bulb_challenge/widgets/horizontal_shimmer_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<HomeHeaderModel> _homeHeader = [];
  List<HomeCategoryModel> _homeCategory = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      _getHomeHeader();
      _getHomeCategory();
    });
  }

  Future<void> _getHomeHeader() async {
    final String response =
        await rootBundle.loadString('assets/samples/home_header.json');
    setState(() {
      _homeHeader = listHomeHeaderModelFromJson(response);
    });
  }

  Future<void> _getHomeCategory() async {
    final String response =
        await rootBundle.loadString('assets/samples/home_categories.json');
    setState(() {
      _homeCategory = listHomeCategoryModelFromJson(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () => Navigator.pushNamed(context, SearchView.routeName),
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.locationDot,
                size: 15,
              ),
              const SizedBox(width: 10),
              Text(
                'KLCC, Malaysia',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 5),
              const Icon(
                FontAwesomeIcons.angleDown,
                size: 20,
              ),
            ],
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            SizeConstant.kDefaultPadding,
            SizeConstant.kDefaultPadding,
            0,
            SizeConstant.kDefaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _homeHeader.isNotEmpty
                  ? HomeHeader(homeHeader: _homeHeader)
                  : HorizontalShimmerWidget(
                      horizontalHeight: 220,
                      width: MediaQuery.of(context).size.width * 0.91,
                    ),
              _rowTitle(context, 'Categories'),
              _homeCategory.isNotEmpty
                  ? HomeCategory(homeCategory: _homeCategory)
                  : const HorizontalShimmerWidget(
                      horizontalHeight: 130,
                      width: 125,
                    ),
              _rowTitle(
                context,
                'What Destination do you like to go to?',
                actions: Expanded(
                  flex: 3,
                  child: ButtonWidget(
                    onPressed: () {},
                    text: 'See More',
                  ),
                ),
              ),
              const HomeDestination(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowTitle(BuildContext context, String title, {Widget? actions}) {
    return Padding(
      padding: const EdgeInsets.only(right: SizeConstant.kDefaultPadding),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(width: 40),
              actions ?? Container(),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
