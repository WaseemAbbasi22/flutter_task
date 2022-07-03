
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_task/constants/app_constants.dart';
import 'package:flutter_task/constants/app_strings.dart';
import 'package:flutter_task/utilities/connectivity_utilities.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_task/utilities/general_utilities.dart';

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
  static Future<dynamic> get(

      String url,

      ) async {

    try {

      var response = await Dio().get(

        AppStrings.getBaseUrl + url,

        options: Options(

          headers: {

            // 'Authorization':

            //     'Bearer ${SessionController().token}'

            'Authorization':

            AppStrings.deviceToken

          },

          followRedirects: false,

          receiveDataWhenStatusError: true,

          sendTimeout: 60 * 1000,

          receiveTimeout: 60 * 1000,

          validateStatus: (status) {

            return status! <= 500;

          },

        ),

      );

      print(response.statusCode);

      return _getResponse(response);

    } catch (e) {

      print(e);

    }

  }
  static dynamic _getResponse(response) {

    switch (response.statusCode) {

      case 200:

        return response;

      case 400:

        return 'Bad request.';

      case 401:

        return 'Number Not Registered';

      case 403:

        return 'Forbidden by server';

      case 404:

        return 'Requested resource not found';

      default:

        return 'Could not connect to server';

    }

  }


}