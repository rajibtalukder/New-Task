import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_task/constants/constants.dart';

import 'api_exception.dart';

class ApiClient {

  Future<dynamic> get(String endPoint, {dynamic header, dynamic query}) async {
    var uri = Uri.parse(baseurl + endPoint).replace(queryParameters: query);
    try {
      var response =
      await http.get(uri, headers: header).timeout(const Duration(seconds: 20));
      print("---------------------");
      print(uri);
      print(response.body);
      print("---------------------");
      return _processResponse(response);
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }


  dynamic _processResponse(http.Response response) {
    var jsonResponse = utf8.decode(response.bodyBytes);
    print(response.statusCode);
    print(response.request!.url);

    switch (response.statusCode) {
      case 200:
        return jsonResponse;
      case 201:
        return jsonResponse;
      case 400:
        throw BadRequestException(
            jsonResponse, response.request!.url.toString());
      case 500:
        throw BadRequestException(
            jsonResponse, response.request!.url.toString());
      default:
        throw ProcessDataException(
            "Error occurred with code ${response.statusCode}",
            response.request!.url.toString());
    }
  }
}