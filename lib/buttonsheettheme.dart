import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/my%20providers.dart';

class ButtonSheetTheme extends StatelessWidget {
  const ButtonSheetTheme({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(onTap: () {
            pro.changeTheme(ThemeMode.light);
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text("Light"),
                Spacer(),
                Icon(Icons.done)
              ],),
            ),
          ),
          Divider(height: 2, color: Theme
              .of(context)
              .primaryColor,
            endIndent: 50,
            indent: 50,),
          InkWell(onTap: () {
            pro.changeTheme(ThemeMode.dark);
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text("Dark"),
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