import 'dart:convert';

import 'package:newsapp/data/model/artical_response.dart';
import 'package:newsapp/data/model/source_response.dart';
import 'package:http/http.dart';

abstract class ApiManager {
  static const String _apiKey = "c3e3e4ec98b246bb90f005f8fe575fa1";
  static const String _baseUrl = "https://newsapi.org";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articalsEndPoint = "/v2/everything";

  static Future<SourcesResponse> getSoucres() async {
    Response servreResponse =
        await get(Uri.parse('$_baseUrl$_sourcesEndPoint?apiKey=$_apiKey'));

    if (servreResponse.statusCode >= 200 && servreResponse.statusCode < 300) {
      Map<String, dynamic> json =
          jsonDecode(servreResponse.body) as Map<String, dynamic>;
      return SourcesResponse.fromJson(json);
    } else {
      throw "something went wrong please try later";
    }
  }

  static Future<ArticalResponse> getArtical(String sourceId) async {
    Response servreResponse = await get(Uri.parse(
        '$_baseUrl$_articalsEndPoint?apiKey=$_apiKey&sources=$sourceId'));

    if (servreResponse.statusCode >= 200 && servreResponse.statusCode < 300) {
      Map<String, dynamic> json =
          jsonDecode(servreResponse.body) as Map<String, dynamic>;
      return ArticalResponse.fromJson(json);
    } else {
      throw "something went wrong please try later";
    }
  }
}
