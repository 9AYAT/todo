
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/buttonsheet.dart';
import 'package:todo/buttonsheettheme.dart';
import '../providers/my providers.dart';
class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(
      child:Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("language"),
        InkWell(onTap: (){
          showButtonSheetLanguage(context);
        },
          child: Container(margin: EdgeInsets.all(8),
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Theme.of(context).primaryColor),
            ), child:Text(pro.language=='ar'?'Arabic':'English'),
          ),
        ),
          SizedBox(height: 25,),
          Text("Theme"),
          InkWell(onTap: (){
            showButtonSheetTheme(context);
          },
            child: Container(margin: EdgeInsets.all(8),
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Theme.of(context).primaryColor),
              ), child:Text("dark"),
            ),
          ),
        ],
      ) ,
    );
  }
  showButtonSheetLanguage(BuildContext context){
    return showModalBottomSheet(context: context, builder: (context){
      return ButtonSheetLang();
    },);
  }
  showButtonSheetTheme(BuildContext context){
    return showModalBottomSheet(context: context, builder: (context){
      return ButtonSheetTheme();
    },);}
}
