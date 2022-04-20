import 'dart:convert';

import 'package:bacheloroppgave/models/TttProjectInfo.dart';

import 'package:http/http.dart' as http;

class HttpRequests {
  static String getTttProjectInfoUrl =
      'http://nvrtx.oslomet.no:8001/drf2/project/3';

  static String postTttObjectUrl =
      "http://nvrtx.oslomet.no:8001/drf2/counting/";

  static Future<TttProjectInfo> fetchTttProjectInfo() async {
    print("Response!");
    final response = await http.get(Uri.parse(getTttProjectInfoUrl));
    print("RESPONSE;");
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
