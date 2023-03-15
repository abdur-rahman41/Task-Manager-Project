
import 'package:flutter/material.dart';

import '../api/apiClient.dart';

class cancelTaskList extends StatefulWidget {
  const cancelTaskList({Key? key}) : super(key: key);

  @override
  State<cancelTaskList> createState() => _cancelTaskListState();
}

class _cancelTaskListState extends State<cancelTaskList> {


  var TaskItems=[];
  bool Loading = true;

  @override
  void initState() {

    CallData();
    super.initState();
  }

  CallData()async
  {



    var data = await  TaskListRequest('Canceled');

    setState(() {
      Loading = false;
      TaskItems =data;
    });

  }



  @override
  Widget build(BuildContext context) {
    return Loading ?(Center(child:CircularProgressIndicator())):(Center(child:Text("Cancel"))); ;
  }
}
