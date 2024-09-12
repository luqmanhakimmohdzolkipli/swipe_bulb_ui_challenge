import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swipe_bulb_challenge/constants/color_constant.dart';
import 'package:swipe_bulb_challenge/models/search_content_model.dart';

class SearchCompany extends StatelessWidget {
  const SearchCompany({super.key, required this.search});

  final SearchContentModel search;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  search.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.locationDot,
                      size: 15,
                      color: ColorConstant.textColorDisable,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      search.location,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorConstant.textColorDisable,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(
                            FontAwesomeIcons.star,
                            size: 15,
                            color: Colors.amber,
                          ),
                        );
                      }),
                    ),
                    const Text('(1.4k Reviews)')
                  ],
                )
              ],
            ),
            const Spacer(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  FontAwesomeIcons.checkDouble,
                  color: Colors.green,
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.eye,
                      size: 13,
                    ),
                    SizedBox(width: 7),
                    Text('24'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
