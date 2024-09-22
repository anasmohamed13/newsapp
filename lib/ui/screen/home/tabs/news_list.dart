import 'package:flutter/material.dart';
import 'package:newsapp/data/api/api_manager.dart';
import 'package:newsapp/data/model/artical.dart';
import 'package:newsapp/data/model/artical_response.dart';
import 'package:newsapp/data/model/source.dart';
import 'package:newsapp/ui/widget/error_view.dart';
import 'package:newsapp/ui/widget/loading_view.dart';

class NewsList extends StatelessWidget {
  final Source source;
  const NewsList({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticalResponse>(
      future: ApiManager.getArtical(source.id!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorView(
            error: snapshot.error.toString(),
            onRetryClick: () {},
          );
        } else if (snapshot.hasData) {
          return buildNewsList(snapshot.data!.articles!);
        } else {
          return const LoadingView();
        }
      },
    );
  }

  Widget buildNewsList(List<Article> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => mapArticalToNewsWidget(list[index]));
  }

  Widget mapArticalToNewsWidget(Article artical) {
    return Column(
      children: [
        Image.network(artical.urlToImage ?? ""),
        Text(artical.source?.name ?? ""),
        Text(artical.title ?? ""),
        Text(artical.publishedAt ?? ""),
      ],
    );
  }
}
