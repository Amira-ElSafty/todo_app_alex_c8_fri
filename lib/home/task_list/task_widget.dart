import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app_c8_fri/firebase_utils.dart';
import 'package:flutter_todo_app_c8_fri/list_provider/list_provider.dart';
import 'package:flutter_todo_app_c8_fri/model/task.dart';
import 'package:flutter_todo_app_c8_fri/my_theme.dart';
import 'package:provider/provider.dart';


class TaskWidget extends StatelessWidget {
  Task task ;
  TaskWidget({required this.task});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.25,
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // All actions are defined in the children parameter.
            children:  [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)
                ),
                onPressed: (context){
                  deleteTaskFromFireStore(task).timeout(Duration(milliseconds: 500),onTimeout: (){
                    print('task was deleted');
                    provider.getAllTasksFromFireStore();
                  });
                },
                backgroundColor: MyThemeData.redColor,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: MyThemeData.whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  color: MyThemeData.primaryLight,
                  height: 80,
                  width: 4,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(task.title,
                            style:  TextStyle(
                              fontSize: 22,
                              color: Theme.of(context).primaryColor
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(task.description,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        )
                      ],
                    ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 21,vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MyThemeData.primaryLight
                  ),
                  child: Icon(Icons.check,color: MyThemeData.whiteColor,size: 35),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
