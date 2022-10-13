// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


String ip = "https://api.fdscarrier.com";

Future getTrackingInfo(String where) async {
  final response = await http.post(
    Uri.parse(ip + '/api/getTracking'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{'Where': where},
    ),
  );

  if (jsonDecode(response.body)['error'] == "") {
    return jsonDecode(response.body)['result'];
  } else {
    return [];
  }
}

