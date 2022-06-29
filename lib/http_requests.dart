// ignore_for_file: uri_does_not_exist

import 'dart:convert';

import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/UserToken.dart';
import 'package:bacheloroppgave/resources/keys.dart';

import 'package:http/http.dart' as http;

import 'local_storage_hive/UnsentTttEntriesBox.dart';
import 'local_storage_hive/TttProjectInfoBox.dart';

///All requests needed for communicating for server
class HttpRequests {

  static String getProjectInfoUrl =
      'https://ltr-abi.no:8443/drf2/project_by_token';

  static String postTttObjectUrl = "https://ltr-abi.no:8443/drf2/counting/";

  static String postLoginUrl = "https://ltr-abi.no:8443/drf2/api-token-auth/";

  static String token = "Token 504503a0095d620206be8ef7f1fbe3c9fee32b91";

  ///GET-method for retrieving TTT project info
  static Future<int> fetchTttProjectInfo() async {

    final userToken = await UserToken.getUserToken();

    final response = await http.get(
      Uri.parse(getProjectInfoUrl),
      headers: {
        'Authorization': "Token " + userToken.toString(),
      },
    );

    if (response.statusCode == 200) {
      //save project info in Hive box
      TttProjectInfo tttProjectInfo = TttProjectInfo.fromJson(jsonDecode(
          utf8.decode(response
              .bodyBytes))); // utf8.decode needed for printing norwegian characters æ, ø and å;
      final tttProjectInfoBox = TttProjectInfoBox.getTttProjectInfo();
      tttProjectInfoBox.put(projectInfoKey, tttProjectInfo);
    }
    return response.statusCode;
  }

  /// POST-method for submitting TTT objects to server
  static Future<int> postTttObject(String jsonBody) async {
    final userToken = await UserToken.getUserToken();

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Token " + userToken.toString(),
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

  /// POST-method for login
  static Future<http.Response> postLogin(
      String username, String password) async {
    final headers = {
      'Content-Type': 'application/json',
    };
    final encoding = Encoding.getByName('utf-8');

    final userCredentials =
        jsonEncode({"username": username, "password": password});

    http.Response response = await http.post(
      Uri.parse(postLoginUrl),
      headers: headers,
      body: userCredentials,
      encoding: encoding,
    );

    return response;
  }

  ///Send all TTT objects that failed to be sent to server
  static Future sendUnsentTttObjects() async {
    final unsentTttEntriesBox = UnsentTttEntriesBox.getTttEntries();

    if (unsentTttEntriesBox.isNotEmpty) {
      for (final key in unsentTttEntriesBox.keys) {
        final tttObject = unsentTttEntriesBox.get(key);
        String jsonBody = jsonEncode(tttObject);
        await postTttObject(jsonBody).then((statusCode) => {
              if (statusCode == 200)
                {
                  unsentTttEntriesBox.delete(key),
                }
            });
      }

      return unsentTttEntriesBox.length;
    }
    return 0;
  }
}
