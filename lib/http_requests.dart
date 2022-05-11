import 'dart:convert';
import 'dart:io';

import 'package:bacheloroppgave/models/TttProjectInfo.dart';

import 'package:http/http.dart' as http;

class HttpRequests {
  static String getTttProjectInfoUrl = 'https://ltr-abi.no:8443/drf2/project/1'; // 8443

  static String postTttObjectUrl = "http://ltr-abi.no:8443/drf2/counting/";

  static String token = "Basic 504503a0095d620206be8ef7f1fbe3c9fee32b91";

  static Future<TttProjectInfo> fetchTttProjectInfo() async {

    String username = 'alf';
  String password = 'a1l2f3xx';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

    final response = await http.get(
      Uri.parse(getTttProjectInfoUrl),
      headers: {
        'authorization': basicAuth,
        HttpHeaders.authorizationHeader: token
        //"Authorization": token
      },
    );

    print("STATUS CODE:");
    print(response.statusCode);

    if (response.statusCode == 200) {
      return TttProjectInfo.fromJson(jsonDecode(utf8.decode(response
          .bodyBytes))); // utf8.decode needed for printing norwegian characters æ, ø and å;
    } else {
      print("FAILED TO LOAD PROJECTINFO");
      throw Exception('Failed to load tttProjectInfo');
    }
  }

  static Future<int> postTttObject(String jsonBody) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
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
