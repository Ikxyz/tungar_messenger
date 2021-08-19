import 'dart:convert';

import "package:http/http.dart" as Http;

class Utils {

  /// Email to Username
  ///
  static String emailToUsername(String email){
    final str = email.split("@")[0];
    return "@$str";
  }

  static String usernameShorten(String username,[int length = 8]){
    final max = username.length;
    final str = username.substring(0,length>=max?max:length);
    return "$str...";
  }

  /// Generate New Name
  static Future<String> generateFullName() async {
    try {
      final url = Uri.parse("https://api.namefake.com");

      final req = await Http.get(url);

      if (req.statusCode == 200) {
        return jsonDecode(req.body)['fsnjfkbkbsdhsbd'];
      }
      return "Jane Doe";
    } catch (e) {
      return "Jane Doe";
    }
  }
}
