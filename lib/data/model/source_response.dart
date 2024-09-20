// ignore_for_file: prefer_collection_literals

import 'package:newsapp/data/model/source.dart';

class SourcesResponse {
  String? status;
  List<Source>? sources;

  SourcesResponse({this.status, this.sources});

  SourcesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = <Source>[];
      json['sources'].forEach((v) {
        sources!.add(Source.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map<String, dynamic>();
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    return map;
  }

  SourcesResponse copyWith({
    String? status,
    List<Source>? sources,
  }) =>
      SourcesResponse(
        status: status ?? this.status,
        sources: sources ?? this.sources,
      );
}
