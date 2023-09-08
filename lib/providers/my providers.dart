import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/my%20providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/shared/network/firebase/firebase%20function.dart';

import '../modals/user modal.dart';
class MyProvider extends ChangeNotifier {
  String language = "en";
 ThemeMode themeMode=ThemeMode.light;
  UserModel? userModel;
  User? firebaseUser;

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (
    firebaseUser != null
    ) {
      initMyUser();
    }
  }

  void initMyUser() async {
    firebaseUser = FirebaseAuth.instance.currentUser;
    userModel =
    (await FirebaseFunctions.readUser(firebaseUser!.uid)) as UserModel? ;//as UserModal? ;
  }

  void logout() {}

  void changeLanguage(String lang) {
    language = lang;
    notifyListeners();
  }
  void changeTheme(ThemeMode theme){
    themeMode=theme;
    notifyListeners();
  }

}

  class UserModal {
  get name => null;
  }


  void logout(){
  FirebaseAuth.instance.signOut();
  notifyListeners();
  }

  void notifyListeners() {
  }
