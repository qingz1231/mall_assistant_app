import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import '../utils/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/titleDesc.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
            child: Column(children: [
          SizedBox(height: screenHeight / 11),
          Image.asset(logo, width: 300),
          Text(register,
              style:
                  TextStyle(fontSize: txt_xlarge, fontWeight: FontWeight.w600)),
          LabelInput(email, emailHint, emailController),
          SizedBox(height: 10),
          LabelInput(password, passwordHint, passwordController),

          SizedBox(height: 10),
          LabelInput(name, nameHint, nameController),
          
          SizedBox(height:20),
          Container(
            width: screenWidth,
            child: ElevatedButton(
              onPressed: () {
                // Handle login logic here
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                backgroundColor: bg_primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
              child: Text(register),
            ),
          ),
        ])),
      ),
    );
  }
}
