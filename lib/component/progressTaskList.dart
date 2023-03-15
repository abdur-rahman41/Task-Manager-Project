
import 'package:flutter/material.dart';

import '../api/apiClient.dart';

class progressTaskList extends StatefulWidget {
  const progressTaskList({Key? key}) : super(key: key);

  @override
  State<progressTaskList> createState() => _progressTaskListState();
}

class _progressTaskListState extends State<progressTaskList> {

  var TaskItems=[];
  bool Loading = true;

  @override
  void initState() {

    CallData();
    super.initState();
  }

  CallData()async
  {



    var data = await  TaskListRequest('Progress');

    setState(() {
      Loading = false;
      TaskItems =data;
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Loading ?(Center(child:CircularProgressIndicator())):(Center(child:Text("New")));;
  }
}
