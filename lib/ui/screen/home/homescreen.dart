import 'package:flutter/material.dart';
import 'package:newsapp/ui/screen/home/tabs/tabs_list.dart';

class Homescreen extends StatelessWidget {
  static const String routeName = "home";
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const TabsList(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("News App"),
      centerTitle: true,
    );
  }
}
