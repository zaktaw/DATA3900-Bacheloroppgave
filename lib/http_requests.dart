// ignore_for_file: uri_does_not_exist

import 'dart:convert';
import 'dart:io';

import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/UserToken.dart';

import 'package:http/http.dart' as http;

class HttpRequests {
  static String getTttProjectInfoUrl = 'https://ltr-abi.no:8443/drf2/project/5';

  static String postTttObjectUrl = "https://ltr-abi.no:8443/drf2/counting/";

  static String postLoginUrl = "https://ltr-abi.no:8443/drf2/";

  static String token = "Token 768fac501b086edd2deaddebd1984c14ca9c5b72";

  // GET-method for retrieving TTT project info
  static Future<TttProjectInfo> fetchTttProjectInfo() async {
    // TODO: replace token with userToken when implemented in backend
    //final userToken = await UserToken.getUserToken();

    final response = await http.get(
      Uri.parse(getTttProjectInfoUrl),
      headers: {
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      return TttProjectInfo.fromJson(jsonDecode(utf8.decode(response
          .bodyBytes))); // utf8.decode needed for printing norwegian characters æ, ø and å;
    } else {
      throw Exception('Failed to load tttProjectInfo');
    }
  }

  // POST-method for submitting TTT objects to server
  static Future<int> postTttObject(String jsonBody) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    final encoding = Encoding.getByName('utf-8');

    http.Response response = await http.post(
      Uri.parse(postTttObjectUrl),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    int statusCode = response.statusCode;
  
    return statusCode;
  }

  // POST-method for login *NOT IMPLEMENTED IN BACKEND*
  static Future<int> postLogin(String jsonBody) async {
    final headers = {
      'Content-Type': 'application/json',
    };
    final encoding = Encoding.getByName('utf-8');

    http.Response response = await http.post(
      Uri.parse(postLoginUrl),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    //int statusCode = response.statusCode;
    int statusCode = 200;

    return statusCode;
  }
}
