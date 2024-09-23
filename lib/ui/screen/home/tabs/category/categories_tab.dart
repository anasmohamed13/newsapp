// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:newsapp/data/model/category.dart';
import 'package:newsapp/ui/screen/home/tabs/category/app_category.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab(
    this.onCategoryClick, {
    super.key,
  });
  final void Function(Category) onCategoryClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Pick Your Category of interest",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              itemCount: Category.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 24, mainAxisSpacing: 14),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClick(Category.categories[index]);
                },
                child: AppCategory(
                  category: Category.categories[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
