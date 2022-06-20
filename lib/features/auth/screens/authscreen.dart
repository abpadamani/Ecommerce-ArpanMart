import 'package:arpanmart/comman/custom_button.dart';
import 'package:arpanmart/comman/custom_textfield.dart';
import 'package:arpanmart/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        name: _namecontroller.text,
        password: _passwordcontroller.text,
        email: _emailcontroller.text);
  }

  Auth _auth = Auth.signin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to ArpanMart",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: _auth == Auth.signup ? Colors.white : Colors.grey[300],
              title: Text("Create An Account"),
              leading: Radio(
                activeColor: Colors.deepOrange,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(8.0),
                child: Form(
                    key: _signupFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: _namecontroller,
                          hintText: "Name",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _emailcontroller,
                          hintText: "E-mail",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordcontroller,
                          hintText: "Password",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            onTap: () {
                              if (_signupFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            },
                            text: "Sign Up"),
                      ],
                    )),
              ),
            ListTile(
              tileColor: _auth == Auth.signin ? Colors.white : Colors.grey[300],
              title: Text("Log In"),
              leading: Radio(
                activeColor: Colors.deepOrange,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(8.0),
                child: Form(
                    key: _signupFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _emailcontroller,
                          hintText: "E-mail",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordcontroller,
                          hintText: "Password",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(onTap: () {}, text: "Login"),
                      ],
                    )),
              ),
          ],
        ),
      )),
    );
  }
}
