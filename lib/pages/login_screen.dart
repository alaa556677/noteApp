import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:noteapp/constants.dart';
import '../ApiRequest.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiRequest apiRequest = ApiRequest();
  var formKey = GlobalKey <FormState> ();
////////////////////////////////////////////////////////////////////////////////
  signUp()async{
    var response = await apiRequest.postRequest(
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
        title: const Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("email Name"),
              TextFormField(
                controller: emailController,
                validator: (value){
                  if(value!.isEmpty){
                    return "required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              const Text("password"),
              TextFormField(
                controller: passwordController,
                validator: (value){
                  if(value!.isEmpty){
                    return "required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              Center(
                child: MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: ()  {
                      if(formKey.currentState!.validate()){
                        signUp();
                      }
                    },
                    child: const Text("Login")
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}