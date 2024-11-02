// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/model/source.dart';
import 'package:newsapp/ui/base/base_api_state.dart';
import 'package:newsapp/ui/screen/home/tabs/news_tab/news_list.dart';
import 'package:newsapp/ui/screen/home/tabs/news_tab/tabs_list_view_model.dart';
import 'package:newsapp/ui/widget/error_view.dart';
import 'package:newsapp/ui/widget/loading_view.dart';

class TabsList extends StatefulWidget {
  final String categoryId;
  const TabsList({super.key, required this.categoryId});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  TabsListcubit viewModel = TabsListcubit();
  int selectedTabIndex = 0;
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsListcubit, TabsListState>(
      bloc: viewModel,
      builder: (context, State) {
        if (State.tabsListApistate is LoadingApiStaet) {
          return const LoadingView();
        } else if (State.tabsListApistate is SuccessApiStaet<List<Source>>) {
          List<Source> sources =
              (State.tabsListApistate as SuccessApiStaet<List<Source>>).data;
          return buildTabsList(sources);
        } else if (State.tabsListApistate is ErrorApiStaet) {
          String errMessage =
              (State.tabsListApistate as ErrorApiStaet).errMessage;
          return ErrorView(error: errMessage, onRetryClick: () {});
        }
        return const LoadingView();
      },
    );
  }

  /// if (snapshot.hasError) {
  /// return ErrorView(
  ///  error: snapshot.error.toString(), onRetryClick: () {},);
  ///  } else if (snapshot.hasData) {
  /// return buildTabsList(snapshot.data!.sources!);
  /// } else {
  ///   return const LoadingView();
  // }

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
