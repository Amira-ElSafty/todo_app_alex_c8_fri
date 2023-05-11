import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_c8_fri/home/task_list/task_widget.dart';
import 'package:flutter_todo_app_c8_fri/list_provider/list_provider.dart';
import 'package:flutter_todo_app_c8_fri/my_theme.dart';

import 'package:provider/provider.dart';


class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    if(provider.taskList.isEmpty){
      provider.getAllTasksFromFireStore();
    }
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: provider.selectedDay,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              provider.setNewsSelectedDay(date);
            },
            leftMargin: 20,
            monthColor: MyThemeData.blackColor,
            dayColor: MyThemeData.blackColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MyThemeData.primaryLight,
            dotsColor: MyThemeData.whiteColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskWidget(task:provider.taskList[index],);
              },
              itemCount: provider.taskList.length,
            ),
          ),
        ],
      ),
    );
  }

}
