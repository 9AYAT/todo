import 'dart:async';
import 'dart:async';
import 'dart:core';
//import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/modals/task%20modal.dart';
import 'package:todo/modals/user%20modal.dart';
import 'package:todo/providers/my%20providers.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModal> getTasksCollection() {
    return FirebaseFirestore.instance.collection("Tasks")
        .withConverter(fromFirestore: (snapshot, _) {
      return TaskModal.fromJson(snapshot.data()!);
    }, toFirestore: (value, _) {
      return value.toJson();
    },
    );
  }

  static Future<void> addTask(TaskModal task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModal>> getTasks(DateTime date) {
    print(date.millisecondsSinceEpoch);
    print(date);
    return getTasksCollection().where("UserId",isEqualTo: FirebaseAuth.instance.currentUser!.uid).where("date", isEqualTo: DateUtils
        .dateOnly(date)
        .millisecondsSinceEpoch).snapshots();
  }

  static Future<void> deleteTask(String id) async {
    getTasksCollection().doc(id).delete();
  }
  static Future<void>isDoneTask(TaskModal task)async{
    getTasksCollection().doc(task.id).update({
      "isDone":!task.isDone!
    });
  }

  static Future <void> updateTask(TaskModal task) async {
    getTasksCollection().doc(task.id).update(task.toJson());
  }

  static Future<UserModel?> readUser(String userId) async {
    DocumentSnapshot<UserModel>userDoc =
    await getUsersCollection().doc(userId).get();
    return userDoc.data();
  }

  //static getUsersCollection() {}
  // static void login(String text, String text2, Future<Object?> pushNamedAndRemoveUntil) {}
//}

  static Future<void> SignUp(String email, String password,String name,int age) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel=UserModel(name: name, age: age,
          id: credential.user!.uid,
          email: email);
    var collection =getUsersCollection();
    var docRef=collection.doc(credential.user!.uid);
    docRef.set(userModel);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
 static Future<void> login(String email,String password,Function onComplete)async {
   try {
     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password
     ).then((value) {
       onComplete();
     });
   } on FirebaseAuthException catch (e) {
     print("wrong email or password");
   //  if (e.code == 'user-not-found') {
     //  print('No user found for that email.');
    // } else if (e.code == 'wrong-password') {
   //    print('Wrong password provided for that user.');
     }
   }
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance.collection("Users")
        .withConverter<UserModel>(fromFirestore: (snapshot, _) {
      return UserModel.fromJson(snapshot.data()!);
    }, toFirestore: (value, _) {
      return value.toJson();
    },
    );
  }}