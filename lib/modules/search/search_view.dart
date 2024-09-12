import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:swipe_bulb_challenge/constants/color_constant.dart';
import 'package:swipe_bulb_challenge/constants/size_constant.dart';
import 'package:swipe_bulb_challenge/models/search_content_model.dart';
import 'package:swipe_bulb_challenge/modules/search/components/search_accommodation.dart';
import 'package:swipe_bulb_challenge/modules/search/components/search_company.dart';
import 'package:swipe_bulb_challenge/modules/search/components/search_image.dart';
import 'package:swipe_bulb_challenge/modules/search/components/search_price.dart';
import 'package:swipe_bulb_challenge/widgets/button_widget.dart';
import 'package:swipe_bulb_challenge/widgets/container_background_image_widget.dart';
import 'package:swipe_bulb_challenge/widgets/vertical_shimmer_widget.dart';

class SearchView extends StatefulWidget {
  static const String routeName = '/search';

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<SearchContentModel> _searchContent = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      _getSearchContent();
    });
  }

  Future<void> _getSearchContent() async {
    final String response =
        await rootBundle.loadString('assets/samples/search_content.json');
    setState(() {
      _searchContent = listSearchContentModelFromJson(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: Container(),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: ColorConstant.containerColorPrimary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'Search Result',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.kDefaultPadding),
        child: _searchContent.isNotEmpty
            ? CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: _searchContent.length,
                      (context, index) {
                        final search = _searchContent[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.only(bottom: 20),
                          elevation: 4,
                          color: ColorConstant.containerColorPrimary,
                          child: Padding(
                            padding: const EdgeInsets.all(
                              SizeConstant.kDefaultPadding,
                            ),
                            child: Column(
                              children: [
                                SearchImage(search: search),
                                const SizedBox(height: 10),
                                SearchPrice(search: search),
                                const SizedBox(height: 10),
                                const SearchAccommodation(),
                                const SizedBox(height: 10),
                                SearchCompany(search: search),
                                const SizedBox(height: 20),
                                _buttonInfo(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : const VerticalShimmerWidget(),
      ),
    );
  }

  Row _buttonInfo() {
    return Row(
      children: [
        Expanded(
          child: ButtonWidget(
            visualDensity: VisualDensity.standard,
            onPressed: () {},
            borderRadius: 50,
            text: 'View Details',
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: ButtonWidget(
            visualDensity: VisualDensity.standard,
            onPressed: () {},
            backgroundColor: ColorConstant.containerColorPrimary,
            borderRadius: 50,
            text: 'Book Now',
            textColor: Colors.black,
            borderColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
