import 'dart:convert';
import 'package:get_storage/get_storage.dart';
// import 'package:hack_niche/firebase_controller.dart';
import 'package:http/http.dart' as http;

class AuthController {
  // FirebaseController _firebaseController = FirebaseController();
  Future<String> login(
    String username,
    String password,
  ) async {
    Uri uri = Uri.parse('http://hacknich.pythonanywhere.com/login/login/');
    final res = await http.post(uri,
        body: jsonEncode({
          "username": username.toString(),
          "password": password.toString(),
          // "token": await _firebaseController.fcmToken.toString()
        }),
        headers: {'Content-Type': 'application/json'});
    final body = res.body;
    if (res.statusCode != 200) {
      print('incorrect');
      return "incorrect_user_details";
    }

    print(res.body);
    final response = jsonDecode(body);
    init(response);
    return "Success";
  }

  void init(res) async {
    try {
      final box = GetStorage();
      box.write('token', res['token']);
      box.write('id', res['user']['id']);
    } catch (e) {
      print(e);
    }

    // String? fcmToken = await _firebaseController.fcmToken;
    // if (fcmToken == null) return;

    // _firebaseController.subscribeToTopic("users");
  }
}
