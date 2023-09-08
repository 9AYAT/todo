import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/edit/editscreen.dart';
import 'package:todo/providers/my%20providers.dart';
import 'package:todo/screens/Signup/sign.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/shared/styles/theming/my%20theme.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'layout/home_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider<MyProvider>
    (create: (context)=>MyProvider(),
    child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of< MyProvider>(context);
    return MaterialApp(
     localizationsDelegates: [
       AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ],
   locale: Locale(provider.language),
        supportedLocales: [
        Locale('en'), // English
    Locale('ar'), // Spanish
    ],
      debugShowCheckedModeBanner: false,
      initialRoute:provider.firebaseUser!=null?HomeLayout.routeName: Login.routeName,
      routes: {
        HomeLayout.routeName:(context)=>HomeLayout(),
        Login.routeName:(context)=>Login(),
        Sign.routeName:(context)=>Sign(),
        EditScreen.routeName:(context)=>EditScreen()
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
     themeMode:provider.themeMode ,
    );}}

