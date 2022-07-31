import 'package:flutter/material.dart';
import 'package:providertutorial/API/api_service.dart';
import 'package:providertutorial/MODELS/api_model.dart';

class GetDataProvider with ChangeNotifier {
  late ApiPracticeModel practice;
  ApiService apiService = ApiService();
  bool isProcessing = false;
  getRData(context) async {
    isProcessing = true;
    practice = (await apiService.getData(context))!;
    isProcessing = false;
    notifyListeners();
  }
}
