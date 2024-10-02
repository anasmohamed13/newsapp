import 'package:flutter/material.dart';
import 'package:newsapp/data/api/api_manager.dart';
import 'package:newsapp/data/model/source.dart';
import 'package:newsapp/data/model/source_response.dart';

class TabsListViewModel extends ChangeNotifier {
  List<Source>? sources;
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSources(String categoryId) async {
    try {
      isLoading = true;
      notifyListeners();
      SourcesResponse sourcesResponse = await ApiManager.getSoucres(categoryId);
      sources = sourcesResponse.sources!;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
