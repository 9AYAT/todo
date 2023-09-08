import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/modals/task%20modal.dart';
import 'package:todo/shared/network/firebase/firebase%20function.dart';
import 'package:todo/shared/styles/colors/app_colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}
class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var selectedDate= DateTime.now();
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8.0),
      child: Form(
        key:formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(alignment: Alignment.center,
                child: Text("Add New Task")),
        SizedBox(height: 30,),
        TextFormField(controller:  titleController,
         // maxLines: 4,
          validator: (value){
            if( value.toString().length<4){
              return "Please enter title at least 4 char";
            }
            return null;
          },
        decoration: InputDecoration(

        label: Text("Task Title"),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: primaryColor)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color: primaryColor))
        ),),
            SizedBox(height: 18),
            TextFormField(controller:  descriptionController,
              decoration: InputDecoration(
                label: Text("Task Description"),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16),),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16))

              ),
            ),
            Container(width: double.infinity,
                child: Text("Select Date")),

                InkWell(onTap: (){
                  ChooseDateTime();
                },
                  child: Container(alignment: Alignment.center,
                      child: Text(selectedDate.toString().substring(0,10)),
                  ),),
            SizedBox(height: 18),
            ElevatedButton(onPressed:(){
              if(formKey.currentState!.validate()){
    TaskModal task=TaskModal(title:titleController.text,
        description: descriptionController.text,userId: FirebaseAuth.instance.currentUser!.uid ,
    date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
    FirebaseFunctions.addTask(task);
      Navigator.pop(context);
    }
    } ,child: Text("Add Task"))
          ]
        ),
      ),
    );}
    void ChooseDateTime()async {
   DateTime?chooseDate= await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate:DateTime.now(),
        lastDate: DateTime.now().add(Duration(days:365)));
   if(chooseDate!=null){
     selectedDate=chooseDate;
     setState(() {

     });
   }
    }
}
