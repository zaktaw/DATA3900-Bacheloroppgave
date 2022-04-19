import 'dart:convert';

import 'package:bacheloroppgave/models/TttProjectInfo.dart';

import 'package:http/http.dart' as http;

class HttpRequests {
  static String getTttProjectInfoUrl =
      'http://nvrtx.oslomet.no:8001/drf2/project/3';

  static Future<TttProjectInfo> fetchTttProjectInfo() async {
    final response = await http.get(Uri.parse(getTttProjectInfoUrl));

    if (response.statusCode == 200) {
      return TttProjectInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tttProjectInfo');
    }
  }
}
