import 'package:flutter/material.dart';
import 'package:prodt_task/home/presentation/component/build_category_tile.dart';

class BuildDrawerWidget extends StatelessWidget {
  const BuildDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          buildCategoryTile(context, "all"),
          buildCategoryTile(context, "national"),
          buildCategoryTile(context, "business"),
          buildCategoryTile(context, "sports"),
          buildCategoryTile(context, "world"),
          buildCategoryTile(context, "politics"),
          buildCategoryTile(context, "technology"),
          buildCategoryTile(context, "startup"),
          buildCategoryTile(context, "entertainment"),
          buildCategoryTile(context, "miscellaneous"),
          buildCategoryTile(context, "hatke"),
          buildCategoryTile(context, "science"),
          buildCategoryTile(context, "automobile"),
        ],
      ),
    );
  }
}
