import 'package:arpanmart/comman/utils.dart';
import 'package:arpanmart/constants/error.dart';
import 'package:arpanmart/models/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String uri = "http://192.168.29.21:3000";
  void signUpUser({
    required BuildContext context,
    required name,
    required password,
    required email,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
