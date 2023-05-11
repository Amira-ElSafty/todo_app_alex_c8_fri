import 'package:flutter/material.dart';
import 'package:flutter_todo_app_c8_fri/firebase_utils.dart';
import 'package:flutter_todo_app_c8_fri/list_provider/list_provider.dart';
import 'package:flutter_todo_app_c8_fri/model/task.dart';

import 'package:provider/provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';

  String description = '';

  DateTime selectedDay = DateTime.now();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late ListProvider provider ;

  @override
  Widget build(BuildContext context) {
     provider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Add Task',
          style: Theme.of(context).textTheme.subtitle1,),
          Form(
            key:formKey ,
              child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onChanged: (text){
                  title = text ;
                },
                validator: (text){
                  if(text == null || text.isEmpty){
                    return 'please enter task title';
                  }
                  return null ;
                },
                decoration: InputDecoration(
                  labelText: 'Enter Task Title'
                ),
              ),
              TextFormField(
                onChanged: (text){
                  description = text ;
                },
                validator: (text){
                  if(text == null || text.isEmpty){
                    return 'please enter task description';
                  }
                  return null ;
                },
                decoration: InputDecoration(
                    labelText: 'Enter Task description'
                ),
                maxLines: 4,
                minLines: 4,
              ),
              SizedBox(height: 12,),
              Text('Select Date',
              style: Theme.of(context).textTheme.subtitle1,),
              InkWell(
                onTap: (){
                  chooseDay();
                },
                child: Text('${selectedDay.day}/${selectedDay.month}/${selectedDay.year}',
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12,),

              ElevatedButton(
                  onPressed: (){
                    addTask();
                  },
                  child: Text('Add',
                  style: Theme.of(context).textTheme.headline1,)
              )
            ],
          ))
        ],
      ),
    );
  }

  void chooseDay()async {
   var chosenDay = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
   if(chosenDay != null){
     selectedDay = chosenDay ;
     setState(() {

     });
   }
  }

  void addTask() {
    if(formKey.currentState?.validate() == true){
      Task task = Task(
          title: title,
          description: description,
          date: selectedDay.millisecondsSinceEpoch);
      addTaskToFireStore(task).timeout(Duration(milliseconds: 500),onTimeout: (){
        print('todo was addedd');
        provider.getAllTasksFromFireStore();
        Navigator.pop(context);
      });
    }

  }
}
