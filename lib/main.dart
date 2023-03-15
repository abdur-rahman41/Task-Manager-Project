import 'package:flutter/material.dart';
import 'package:taskmanager1/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanager1/screen/onboarding/loginScreen.dart';
import 'package:taskmanager1/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmanager1/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager1/screen/onboarding/setPasswordScreen.dart';

import 'package:taskmanager1/screen/task/homeScreen.dart';
import 'package:taskmanager1/component/newTaskList.dart';
import 'package:taskmanager1/utility/utility.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
         String? token  = await ReadUserData("token");
         if(token==null)
           {
             runApp(MyApp('/login'));

           }
         else
           {
             runApp(MyApp('/'));
           }

}

class MyApp extends StatelessWidget {
 final String firstRoute;
   MyApp(this.firstRoute);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',

     initialRoute: firstRoute,
      routes: {
        '/':(context)=>homeScreen(),
        '/login':(context)=>loginScreen(),
        '/registration':(context)=>registrationScreen(),
        '/emailVerification':(context)=>emailVerificationScreen(),
        '/pinVerification':(context)=>pinVerificationScreen(),
        '/setPassword':(context)=>setPasswordScreen(),
        '/newTaskList':(context)=>newTaskList(),
      },
    );
  }
}

