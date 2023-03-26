import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getData(String url) async {
  String data;
  String error;

  try {
    http.Response response = await http
        .get(Uri.parse(url));

    if (response.statusCode == 200) {
      data = response.body;

      return data;
    } else {
      error = "Server error: ${response.statusCode}";
      return error;
    }
  } catch (e) {
    error = "Network error: $e";
    return error;
  }
}
