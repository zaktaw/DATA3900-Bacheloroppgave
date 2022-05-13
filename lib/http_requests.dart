import 'dart:convert';
import 'dart:io';

import 'package:bacheloroppgave/models/TttProjectInfo.dart';

import 'package:http/http.dart' as http;

class HttpRequests {
  static String getTttProjectInfoUrl =
      'https://ltr-abi.no:8443/drf2/project/4'; // 8443

  static String postTttObjectUrl = "https://ltr-abi.no:8443/drf2/counting/";

  static String token = "Token 768fac501b086edd2deaddebd1984c14ca9c5b72";

  static Future<TttProjectInfo> fetchTttProjectInfo(String id) async {
    String getTttObjectUrl2 = "https://ltr-abi.no:8443/drf2/project/" + id;

    String username = 'alf';
    String password = 'a1l2f3xx';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    final response = await http.get(
      Uri.parse(getTttProjectInfoUrl),
      headers: {
        'Authorization': token,
        //HttpHeaders.authorizationHeader: token
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
      'Authorization': token,
      //'Cookie': 'key=first-value'
    };
    final encoding = Encoding.getByName('utf-8');

    //print("JSON BODY:");
    //print(jsonBody);
    String jsonTest =
        '{"project_id":4,"observer_name":"Alf","timestamp":"2022-05-12 13:18","ActivityZones":[{"zone_ID":"5","Activities":[{"code":"ALLAP","count":1},{"code":"GRUDIG","count":0},{"code":"KØ","count":0}]},{"zone_ID":"6","Activities":[{"code":"ALLAP","count":1},{"code":"GRUDIG","count":0},{"code":"KØ","count":0}]}]}';

    http.Response response = await http.post(
      Uri.parse(postTttObjectUrl),
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    int statusCode = response.statusCode;
    String responseBody = response.body;

    print("POST RESPINSE BODY");
    print(responseBody);

    return statusCode;
  }
}
