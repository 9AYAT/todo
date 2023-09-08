import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/my%20providers.dart';
import 'package:todo/screens/Tasks/add%20task%20bottom.dart';
import 'package:todo/screens/Tasks/tasks.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/screens/settings.dart';

import '../shared/styles/colors/app_colors.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName="hhh";
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;
 List<Widget>tabs=[TasksTab(),Settings()];
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          pro.logout();
          Navigator.pushNamedAndRemoveUntil(context, Login.routeName, (route) => false);
        }, icon: Icon(
          Icons.logout,
          color: Colors.white,
        ),  ),
      ],
        title: Text("ToDo${pro.userModel?.name}"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100),side:BorderSide(color: Colors.white ,
       width: 3 )
      ),
        onPressed: (){
        showAddTaskBottomSheet();
        },
      child: Icon(Icons.add,size: 30,),),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        color:Colors.white ,
        child: BottomNavigationBar(
          elevation:0,
          backgroundColor:Colors.red,
          currentIndex:currentIndex,
          onTap: (value){
            currentIndex=value;
            setState(() {});},
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: "",
            ),

            BottomNavigationBarItem(icon: Icon(Icons.settings),label:"")
          ],
        ),
      ),
      body:tabs[currentIndex] ,
    );
  }
  void showAddTaskBottomSheet(){
    showModalBottomSheet(isScrollControlled: true,
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(18),topLeft: Radius.circular(18))
    ),
        context: context
        , builder: (context) =>Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBottomSheet()));

  }
}
