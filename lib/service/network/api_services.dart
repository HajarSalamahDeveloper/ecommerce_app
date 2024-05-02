import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class ApiNetworkingServices {
  dynamic responseJson;

  Future<dynamic> getApi(String url) async {
    try {
      print("responseJson1$url");
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 60));
      responseJson = returnResponse(response);
      print("responseJson");
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    // print(responseJson);
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        // print("RRRRRREEMM${responseJson}");
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
            'Error accoured while communicating with server ' +
                response.statusCode.toString());
    }
  }
}
