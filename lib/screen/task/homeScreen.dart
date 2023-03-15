import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager1/component/appBottomNav.dart';
import 'package:taskmanager1/component/cancelTaskList.dart';
import 'package:taskmanager1/component/completedTaskList.dart';
import 'package:taskmanager1/component/newTaskList.dart';
import 'package:taskmanager1/component/progressTaskList.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int bottomTabindex=0;
  onItemTapped(int index)
  {
    setState(() {
        bottomTabindex=index;
    });
  }

  final widgetOptions=[
    newTaskList(),
    progressTaskList(),
    completedTaskList(),
    cancelTaskList(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Task Manager"),),
      body: widgetOptions.elementAt(bottomTabindex),
      bottomNavigationBar: appBottomNav(bottomTabindex,onItemTapped),
    );
  }
}
