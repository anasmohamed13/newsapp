// ignore_for_file: prefer_collection_literals

import 'package:newsapp/data/model/artical.dart';

class ArticalResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;

  ArticalResponse({this.status, this.totalResults, this.articles});

  ArticalResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Article>[];
      json['articles'].forEach((v) {
        articles!.add(Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
