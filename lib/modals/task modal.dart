import 'dart:convert';

import 'package:flutter/widgets.dart';

class TaskModal{
  String id;
  String title;
  String description;
  int date;
  bool isDone;
  String userId;
  TaskModal(
      { required this.date,
        required this.description,
        this.id="",
        required this.title,
        required this.userId,
  this.isDone=false}
      );
  TaskModal.fromJson(Map<String,dynamic>json)
      :this(
            date:json['date'],
            isDone:json['isDone'],
            id:json['id'],
            title:json['title'],
           description:json['description'],
userId: json['userId']
  );
 Map<String,dynamic>toJson(){
   return{
     "id":id,
     "title":title,
     "description":description,
    "isDone":isDone,
     "date":date,
     "userId":userId
   };
 }



}