// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//String ip = "https://api.fdscarrier.com";
String ip = "http://127.0.0.1:4000";

Future<List> getTrackingInfo(String where) async {
  final response = await http.post(
    Uri.parse('$ip/api/getTracking'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Access-Control-Allow-Credentials': 'true',
    },
    body: jsonEncode(
      <String, String>{'Where': where},
    ),
  );

  return jsonDecode(response.body)["result"];
}
