import 'package:flutter/material.dart';
import 'package:newsapp/data/model/category.dart';
import 'package:newsapp/ui/screen/home/tabs/category/app_category.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Pick Your Category of interest"),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              itemCount: Category.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 24, mainAxisSpacing: 14),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Category.categories[index];
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
