import 'package:flutter/material.dart';
import 'package:newsapp/data/model/category.dart';

class AppCategory extends StatelessWidget {
  final Category category;

  const AppCategory({super.key, required this.category});

  final radius = const Radius.circular(24);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: radius,
          topLeft: radius,
          bottomLeft: !category.isLeftSided ? Radius.zero : radius,
          bottomRight: category.isLeftSided ? Radius.zero : radius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * .15,
          ),
          Text(
            category.title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
