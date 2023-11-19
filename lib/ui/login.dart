import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/service/customer_service.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/title_desc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: screenHeight / 11),
                Image.asset(logo, width: 300),
                Text(
                  login,
                  style: TextStyle(
                    fontSize: txt_xlarge,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                LabelInput(email, emailHint, emailController),
                SizedBox(height: 10),
                LabelInput(password, passwordHint, passwordController),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    forgotPassword,
                    style: TextStyle(fontSize: txt_small, color: txt2),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth,
                  child: ElevatedButton(
                    onPressed: emailController.text.trim().isEmpty ||
                            passwordController.text.trim().isEmpty
                        ? null // Disable button if either field is empty
                        : () async {
                            var _username = emailController.text.trim();
                            var _password = passwordController.text.trim();

                            if (await CustomerService.login(_username, _password)) {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      backgroundColor: bg_primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      textStyle: TextStyle(fontSize: txt_medium),
                    ),
                    child: Text(login),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    children: [
                      Text("Don't have an account yet?",
                          style: TextStyle(fontSize: txt_medium)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: txt_medium, color: bg_primary),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
