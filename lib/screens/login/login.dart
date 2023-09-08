import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/providers/my%20providers.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/shared/network/firebase/firebase%20function.dart';
import 'package:todo/shared/styles/colors/app_colors.dart';

import '../Signup/sign.dart';
import 'login.dart';
class Login extends StatelessWidget {
 static const String routeName="hhgg";
var formKey=GlobalKey<FormState>();
var emailController=TextEditingController();
var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pro=  Provider.of<MyProvider>(context);
    return Container(decoration: BoxDecoration(),
        child: Scaffold(
          backgroundColor: Colors.red,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(key:formKey,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [TextFormField
                  (controller: emailController,
                  validator:(value){
                  if(value==null||value=="") {
                    return "enter user name";
                  }
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                      .hasMatch(value);
                  if(!emailValid){
                    return"please enter valid email";
                  }
                  return null;
                  } ,
                  decoration: InputDecoration(
                    label: Text("username"),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                  borderSide:BorderSide(color: primaryColor) ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                      borderSide:BorderSide(color: primaryColor) ),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              borderSide:BorderSide(color: primaryColor),), ),),
    SizedBox(height: 15,),
    TextFormField(controller: passwordController,
      validator:(value){
    if(value==null||value.length<6){
      return "enter valid pass";
    }
    return null;
    } ,
    decoration: InputDecoration(
    label: Text("password"),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
    borderSide:BorderSide(color: primaryColor)
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
    borderSide:BorderSide(color: primaryColor) ),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
    borderSide:BorderSide(color: primaryColor),), ),),
                  ElevatedButton(onPressed: (){
                    if(formKey.currentState!.validate()){
FirebaseFunctions.login(
  emailController.text,passwordController.text,(){
    Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);

  });

  //Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false));
//pro.initMyUser();


                    }},
                   child: Text("login")),
                  Row(children: [Text("Dont have an account"),
                    TextButton(onPressed: (){ Navigator.pushNamedAndRemoveUntil(context, Sign.routeName,(route)=>false);},
                      child: Text("create account"),)
                  ]),]),
                ), ),),
    );

  }
}
