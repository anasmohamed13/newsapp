import 'package:flutter/material.dart';
import 'package:newsapp/ui/screen/home/homescreen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homescreen.routeName: (context) => const Homescreen(),
      },
      initialRoute: Homescreen.routeName,
    );
  }
}
