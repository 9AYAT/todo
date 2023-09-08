import 'package:todo/providers/my%20providers.dart';

class UserModel{
  String id;
  String name;
  int age;
  String email;


  UserModel({required this.name,required this.age,this.id="",required this.email}
      );
      UserModel.fromJson(Map<String,dynamic>json):this(
        id:json['id'],
        name: json['name'],email: json['email'],
        age: json['age']
      );
      Map<String,dynamic>toJson(){
        return{
          "id":id,
          "name":name,
          "email":email,
          "age":age
        };
      }
}