import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/service/customer_service.dart';
import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/title_desc.dart';

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
      body: SingleChildScrollView(
          child: Padding(
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
                    var _name = nameController.text.trim();
                    var _username = emailController.text.trim();
                    var _password = passwordController.text.trim();
             
    
                    CustomerService.register(_name, _username, _password);
    
                    Navigator.pop(context);
    
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
        ),
    );
  }
}
