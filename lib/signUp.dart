import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:noteapp/constants.dart';
import 'crud.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiRequest apiRequest = ApiRequest();
////////////////////////////////////////////////////////////////////////////////
  signUp() async{
    final response = await apiRequest.postRequest(
      "${Constants.linkServerName}${Constants.linkSignUp}",
      {
         "userName" : userNameController.text,
         "email" : emailController.text,
         "password" : passwordController.text,
      }
    );
    if(response['status'] == "success"){
      log("you are great man");
    }else{
      log("failed");
    }
  }
////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up Screen"),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("User Name"),
            TextFormField(
              controller: userNameController,
            ),
            const SizedBox(height: 20,),
            const Text("email Name"),
            TextFormField(
              controller: emailController,
            ),
            const SizedBox(height: 20,),
            const Text("password"),
            TextFormField(
              controller: passwordController,
            ),
            const SizedBox(height: 20,),
            Center(
              child: MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: ()  {
                  log("pressed");
                  signUp();
                },
                child: const Text("SIGN UP")
              ),
            ),
          ],
        ),
      ),
    );
  }
}