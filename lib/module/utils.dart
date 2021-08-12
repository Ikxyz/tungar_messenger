import 'dart:convert';

import "package:http/http.dart" as Http;

class Utils {
  /// Generate New Name
  static Future<String> generateFullName() async {
    try {
      final url = Uri.parse("https://api.namefake.com");

      final req = await Http.get(url);

      if (req.statusCode == 200) {
        return jsonDecode(req.body)['name'];
      }
      return "Jane Doe";
    } catch (e) {
      return "Jane Doe";
    }
  }
}
