import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/Signup/sign.dart';
import 'package:todo/screens/Signup/sign.dart';
import 'package:todo/screens/Signup/sign.dart';
import 'package:todo/screens/Signup/sign.dart';
import 'package:todo/screens/Signup/sign.dart';
import 'package:todo/shared/network/firebase/firebase%20function.dart';

import '../../shared/styles/colors/app_colors.dart';
import '../login/login.dart';
import 'sign.dart';

class Sign extends StatelessWidget {
 static const String routeName="jj";
var formKey=GlobalKey<FormState>();
var emailController=TextEditingController();
 var passwordController=TextEditingController();
 var nameController=TextEditingController();
 var ageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(),
        child: Scaffold(
          backgroundColor: Colors.orange,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(key:formKey,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [TextFormField
                    (controller: nameController,
                    textInputAction: TextInputAction.next,
                    validator:(value){
                      if(value==null||value=="") {
                        return "please enter name";
                      }
                      return null;
                    } ,
                    decoration: InputDecoration(
                      label: Text("name"),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                        borderSide:BorderSide(color: primaryColor) ),

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                          borderSide:BorderSide(color: primaryColor) ),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                        borderSide:BorderSide(color: primaryColor),), ),),
                    SizedBox(height: 15,),
                    TextFormField(controller: ageController,
                      textInputAction: TextInputAction.next,
                      validator:(value){
                        if(value==null||value==""){
                          return "please enter age";}
                        return null;
                      } ,
                      keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                        label: Text("age"),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                          borderSide:BorderSide(color: primaryColor)
                      ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                            borderSide:BorderSide(color: primaryColor) ),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                          borderSide:BorderSide(color: primaryColor),), ),),
              TextFormField
                        (controller: emailController,
                textInputAction: TextInputAction.next,
                        validator:(value){
                          if(value==null||value=="") {
                            return "enter email";
                          }
                          final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                  .hasMatch(value);
                if(!emailValid){
          return"please enter valid email";
          }
              return null;},
                        decoration: InputDecoration(
                          label: Text("email"),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                            borderSide:BorderSide(color: primaryColor) ),

                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                              borderSide:BorderSide(color: primaryColor) ),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                            borderSide:BorderSide(color: primaryColor),), ),),
                        SizedBox(height: 15,),

                        TextFormField(controller: passwordController,
                          textInputAction: TextInputAction.done,
                          validator:(value){
                            if(value==null||value.length<4){
                              return "enter valid pass";
                            }
                            return null;
                          } ,
                          keyboardType:TextInputType.number,
                          decoration: InputDecoration(
                            label: Text("Password"),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                              borderSide:BorderSide(color: primaryColor)

                          ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                                borderSide:BorderSide(color: primaryColor) ),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                              borderSide:BorderSide(color: primaryColor),), ),),
    ElevatedButton(onPressed: (){if(formKey.currentState!.validate()){
                         FirebaseFunctions.SignUp(emailController.text,passwordController.text,nameController.text,int.parse(ageController.text)).then((value){

                           Navigator.pushNamedAndRemoveUntil(context,Login.routeName,(route)=>false);
                         }).catchError((e){
                           print(e);
                         }
                         );
                           }
                         // if(formKey.currentState!.validate()){
                         //   FirebaseFunctions.Sign(emailController.text,passwordController.text).then(value){
                         //    Navigator.pushedNamedAndRemoveUntil(context,Login.routeName,(route)=>false);
                          // }).catchErrr((e){
                            //  print(e);
                         // });
                        //  }
  }, child: Text("sign up")),
    Row(children: [Text("I have an account"),
    TextButton(onPressed: (){ Navigator.pushNamedAndRemoveUntil(context, Login.routeName,(route)=>false);},
    child: Text("Login"),)

    ]),]),),),),);}}