import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/Tasks/task%20item.dart';
import 'package:todo/shared/styles/colors/app_colors.dart';

import '../../shared/network/firebase/firebase function.dart';

class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CalendarTimeline(
        initialDate: DateTime.now(),
    shrink: true,
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),
        onDateSelected: (date) {
          selectedDate=date;
          setState(() {

          });
        },
        leftMargin: 20,
        monthColor: primaryColor,
        dayColor: primaryColor.withOpacity(.6),
        activeDayColor: Colors.white,
        activeBackgroundDayColor: primaryColor,
        dotsColor: primaryColor,
        selectableDayPredicate: (date) => date.day != 15,
        locale: 'ar',
      ),
    StreamBuilder(stream: FirebaseFunctions.getTasks(selectedDate),
    builder:(context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return CircularProgressIndicator();
      }
      if(snapshot.hasError){
        return Text("something errror");
      }var tasks=snapshot.data?.docs.map((e) => e.data()).toList()??[];
      if(tasks.isEmpty){
        return Center(child: Text("No Tasks"),);
      }
      return Expanded(
        child: ListView.builder(itemBuilder: (context,index){
          return TaskItem(taskModal: tasks[index],);
        },
          itemCount: tasks.length,),
      );
    } ,),
      ]);}}