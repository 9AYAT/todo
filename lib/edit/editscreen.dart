import 'package:flutter/material.dart';
import 'package:todo/modals/task%20modal.dart';

class EditScreen extends StatelessWidget {
  static const String routeName="jjj";
  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context)?.settings.arguments as TaskModal;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
        centerTitle: true,
      ),
      body: Container(padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(25),
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.white)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  decoration:InputDecoration(
                    label: Text("Title")
                  ),
                ),
                Spacer(flex: 2,),
                TextFormField(decoration:InputDecoration(
                    label: Text("Description")),),
                Spacer(flex: 2,),
                Text("Select Time"),
                Spacer(flex: 1,),
                Text("Date"),
                Spacer(flex: 2,),
                ElevatedButton(onPressed: (){}, child: Text("Update Task")),
                Spacer()

              ],
            ),
          ),
        ),
      ),
    );
  }
}
