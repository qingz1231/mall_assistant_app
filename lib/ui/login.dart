import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/service/customer_service.dart';
import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/title_desc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController ontroller = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
              child: Column(children: [
            SizedBox(height: screenHeight / 11),
            Image.asset(logo, width: 300),
            Text(login,
                style:
                    TextStyle(fontSize: txt_xlarge, fontWeight: FontWeight.w600)),
            LabelInput(email, emailHint, emailController),
            SizedBox(height: 10),
            LabelInput(password, passwordHint, passwordController),
            
            Container(
              alignment: Alignment.centerRight,
              child: Text(forgotPassword, style: TextStyle(fontSize: txt_small,color: txt2),)
              
              ),
            
            SizedBox(height:20),
            Container(
              width: screenWidth,
              child: ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                  var _username   = emailController.text.trim();
                  var _password   = passwordController.text.trim();
                  CustomerService.login(_username, _password);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  backgroundColor: bg_primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  textStyle: TextStyle(
                    fontSize: txt_medium
                  )
                ),
                child: Text(login),
              ),
            ),

            SizedBox(height:10),

            Container(
     
              child: Row(
                
                
                children: [
                  Text("Don't have an account yet?",style: TextStyle(fontSize: txt_medium)),
                  GestureDetector(onTap:(){Navigator.pushNamed(context, '/register');} ,child: Text("Register",style: TextStyle(fontSize: txt_medium,color: bg_primary),)),
                ],
              ),
            )
          ])),
        ),
      );
  }
}
