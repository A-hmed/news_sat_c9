import 'package:flutter/material.dart';
import 'package:news_sat_c9/data/api_manager.dart';
import 'package:news_sat_c9/data/model/sources_response.dart';

class NewsTabViewModel extends ChangeNotifier{
  List<Source> sources = [];
  bool isLoading = false;
  String? errorText;

  void getSources(String categoryId) async{
    isLoading = true;
    try{
      notifyListeners();
      sources = await ApiManager.getSources(categoryId);
      isLoading = false;
      notifyListeners();
    }catch(e){
      isLoading = false;
      errorText = e.toString();
      notifyListeners();
    }
  }
}