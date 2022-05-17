
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rns_flutter_task/constants/app_constants.dart';
import 'package:rns_flutter_task/utilities/connectivity_utilities.dart';
import 'package:http/http.dart' as http;
import 'package:rns_flutter_task/utilities/general_utilities.dart';

class WebService{
  static Future<int> fetchRandomNumbersFromApis(BuildContext context) async {
    if (await ConnectivityUtilities.checkInternetConnectivity() == true) {

      final response = await http.get(Uri.parse(AppConstants.apiUrl));

      if (response.statusCode == 200) {
        final  Iterable  apiResponse = jsonDecode(response.body.toString());


        return int.parse(apiResponse.first.toString());
      } else {
        throw Exception("Unable to perform request!");
      }
    } else {
      GeneralUtilities.showMessage(context: context, title: "Info", text: "Please Check Your Internet Connection!");
      return 0;
    }
  }
}