import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/my%20providers.dart';

class ButtonSheetLang extends StatelessWidget {
  const ButtonSheetLang({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(onTap: (){
            pro.changeLanguage('ar');
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text("Arabic"),
                Spacer(),
                Icon(Icons.done)
              ],),
            ),
          ),
          Divider(height: 2,color: Theme.of(context).primaryColor,
          endIndent: 50,
          indent: 50,),
          InkWell(onTap: (){
            pro.changeLanguage('en');
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text("English"),
                Spacer(),
                Icon(Icons.done)
              ],),
            ),
          )
        ],
      ),
    );
  }
}
