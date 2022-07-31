import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:providertutorial/MODELS/api_model.dart';
import 'package:toast/toast.dart';

class ApiService {
  Future<ApiPracticeModel?> getData(context) async {
    // ignore: unused_local_variable
   late ApiPracticeModel result;
    try {
      String url = 'https://reqres.in/api/users?page=2';
      Uri uri = Uri.parse(url);
      final response = await http.get(uri);
      // final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // final item = jsonDecode(response.body);
        result = ApiPracticeModel.fromJson(data);
      } else {
        Toast.show('Data is incorrect');
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

}
