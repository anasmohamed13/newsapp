import 'package:flutter/material.dart';
import 'package:newsapp/data/api/api_manager.dart';
import 'package:newsapp/data/model/source.dart';
import 'package:newsapp/data/model/source_response.dart';
import 'package:newsapp/ui/screen/home/tabs/news_list.dart';
import 'package:newsapp/ui/widget/error_view.dart';
import 'package:newsapp/ui/widget/loading_view.dart';

class TabsList extends StatefulWidget {
  const TabsList({super.key});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSoucres(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorView(
            error: snapshot.error.toString(),
            onRetryClick: () {},
          );
        } else if (snapshot.hasData) {
          return buildTabsList(snapshot.data!.sources!);
        } else {
          return const LoadingView();
        }
      },
    );
  }

  Widget buildTabsList(List<Source> sources) {
    List<Widget> tabs = sources
        .map(
          (source) => mapSourceToTab(
            source,
            selectedTabIndex == sources.indexOf(source),
          ),
        )
        .toList();
    List<Widget> tabsBody = sources
        .map(
          (source) => NewsList(
            source: source,
          ),
        )
        .toList();

    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          TabBar(
            onTap: (index) {
              selectedTabIndex = index;
              setState(() {});
            },
            tabs: tabs,
            isScrollable: true,
            indicatorColor: Colors.transparent,
          ),
          Expanded(
            child: TabBarView(children: tabsBody),
          )
        ],
      ),
    );
  }

  buildErrorState(String error) {}

  Widget mapSourceToTab(Source source, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.blue, width: 3),
          color: isSelected ? Colors.blue : Colors.white),
      child: Text(
        source.name ?? "",
        style: TextStyle(color: isSelected ? Colors.white : Colors.blue),
      ),
    );
  }
}
