import 'package:flutter/material.dart';
import 'package:newsapp/ui/screen/home/tabs/category/categories_tab.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = "home";
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        drawer: buildDrawer(),
        body: const CategoriesTab(),
      ),
    );
  }

  Widget buildDrawerRow(
      {required String title,
      required IconData iconData,
      required void Function() onClick}) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 32,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * .08,
      backgroundColor: Colors.green,
      title: const Text("News App"),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }

  Widget buildDrawer() => Drawer(
        child: Column(
          children: [
            buildDrawerHeader(),
            const SizedBox(
              height: 8,
            ),
            buildDrawerRow(
                title: "categories", iconData: Icons.list, onClick: () {}),
            const SizedBox(
              height: 8,
            ),
            buildDrawerRow(
                title: "settings", iconData: Icons.settings, onClick: () {}),
          ],
        ),
      );

  Container buildDrawerHeader() {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.green),
      child: const Center(
        child: Text(
          "News App!",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
}
