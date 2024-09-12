import 'package:flutter/material.dart';
import 'package:swipe_bulb_challenge/models/search_content_model.dart';

class SearchPrice extends StatelessWidget {
  const SearchPrice({super.key, required this.search});

  final SearchContentModel search;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          search.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          'RM 2,961',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
