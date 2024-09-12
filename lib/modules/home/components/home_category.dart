import 'package:flutter/material.dart';
import 'package:swipe_bulb_challenge/constants/color_constant.dart';
import 'package:swipe_bulb_challenge/models/home_category_model.dart';
import 'package:swipe_bulb_challenge/widgets/horizontal_scroll_widget.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key, required this.homeCategory});

  final List<HomeCategoryModel> homeCategory;

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return HorizontalScrollWidget(
      horizontalHeight: 120,
      delegate: SliverChildBuilderDelegate(
        childCount: widget.homeCategory.length,
        (context, index) {
          final category = widget.homeCategory[index];
          final isSelected = _selectedIndex == index;
          return SizedBox(
            width: 110,
            child: Card(
              elevation: isSelected ? 5 : 1,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : ColorConstant.containerColorPrimary,
              margin: const EdgeInsets.only(right: 10, bottom: 5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        category.image,
                        width: 50,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        category.title,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
