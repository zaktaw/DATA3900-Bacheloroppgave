import 'dart:convert';

import 'package:bacheloroppgave/models/TttProjectInfo.dart';

import 'package:http/http.dart' as http;

class HttpRequests {
  static String getTttProjectInfoUrl =
      'http://ltr-abi.no:8443/drf2/project/1';

  static String postTttObjectUrl =
      "http://ltr-abi.no:8443/drf2/counting/";

  static Future<TttProjectInfo> fetchTttProjectInfo() async {
  
    final response = await http.get(Uri.parse(getTttProjectInfoUrl));
    
    if (response.statusCode == 200) {
      return TttProjectInfo.fromJson(jsonDecode(utf8.decode(response
          .bodyBytes))); // utf8.decode needed for printing norwegian characters æ, ø and å;
    } else {
      print("FAILED TO LOAD PROJECTINFO");
      throw Exception('Failed to load tttProjectInfo');
    }
  }

  static Future<int> postTttObject(String jsonBody) async {
    final headers = {'Content-Type': 'application/json'};
    final encoding = Encoding.getByName('utf-8');

    http.Response response = await http.post(
      Uri.parse(postTttObjectUrl),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    int statusCode = response.statusCode;
    String responseBody = response.body;

    return statusCode;
  }
}
