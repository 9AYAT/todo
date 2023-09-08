import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/edit/editscreen.dart';
import 'package:todo/modals/task%20modal.dart';
import 'package:todo/shared/network/firebase/firebase%20function.dart';
import 'package:todo/shared/styles/colors/app_colors.dart';

class TaskItem extends StatefulWidget {
  TaskModal taskModal;


  TaskItem( { required this.taskModal,super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}
class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: StretchMotion(), children: [ SlidableAction(
        // An action can be bigger than the others.
       flex: 2,
        onPressed: (context){
         FirebaseFunctions.deleteTask(widget.taskModal.id);
        },
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
        backgroundColor: Color(0xFF7BC043),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
      ),
      SlidableAction(
        flex: 1,
          onPressed:(context){
          Navigator.pushNamed(context,EditScreen.routeName,arguments:widget.taskModal );
          } , borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',),]),
      child: Card(
        elevation: 8,
        margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(16),),
        child: Container(
          child:Row(
            children: [
              Container(
                height: 80,
                //color: primaryColor,
                decoration: BoxDecoration(color: widget.taskModal.isDone!?Colors.green:Colors.blue),
                width: 4,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.taskModal.title,style: GoogleFonts.quicksand(fontSize: 18),),
                  Text(widget.taskModal.description,style: GoogleFonts.quicksand(fontSize: 18),)
                ],
              ),
            const Spacer(),
              InkWell(onTap: (){
                //taskModal.isDone=!taskModal.isDone;
               // FirebaseFunctions.updateTask(taskModal );
                FirebaseFunctions.isDoneTask(widget.taskModal);
                setState((){});
                },
                child:widget.taskModal.isDone!?Text("Done",style:TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 25),):
                 Container(
                  padding: EdgeInsets.symmetric(vertical: 2,horizontal: 12),
                  decoration:
                  BoxDecoration(
                    color: widget.taskModal.isDone?Colors.green:primaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child:Icon(Icons.done,color: Colors.white,) ,
                ),
              )
            ],
          ) ,
        ),
      ),
    );
  }
}
